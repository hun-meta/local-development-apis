#!/bin/bash

# Get docker image ids which are <none>:<none> (dangling)
none_images=$(docker images -f "dangling=true" -q)

# Check if dangling images exist
if [ -z "$none_images" ]
then
    echo "No dangling images found"
else
    # Find, stop, and delete containers which used dangling images
    echo "Stopping and removing containers which used dangling images:"
    for image in $none_images
    do
        containers=$(docker ps -a --filter "ancestor=$image" --format "{{.ID}}")
        if [ ! -z "$containers" ]
        then
            echo "Image $image , Containers: $containers"
            for container in $containers
            do
                # Check if the container is running
                if [ "$(docker ps -q -f id=$container)" ]; then
                    echo "Stopping container $container"
                    docker stop $container
                    if [ $? -ne 0 ]; then
                        echo "Error occurred while stopping container $container"
                        continue
                    fi
                fi
                
                # Remove the container
                docker rm $container
                if [ $? -eq 0 ]; then
                    echo "Container $container deleted successfully"
                else
                    echo "Error occurred while deleting container $container"
                fi
            done
        fi
    done

    # Delete <none>:<none> images
    echo "Deleting the following <none>:<none> images:"
    echo "$none_images"
    docker rmi $none_images
    
    # Check the deletion result
    if [ $? -eq 0 ]
    then
        echo "All <none>:<none> images have been successfully deleted"
    else
        echo "Error occurred while deleting some images. Please check if any images are in use"
    fi
fi
