# define job to build and publish docker image
build-and-push-docker-image:
 needs: test-backend
 # run only when code is compiling and tests are passing
 runs-on: ubuntu-24.04

 # steps to perform in job
 steps:
   - name: Checkout code
     uses: actions/checkout@v4

   - name: Build image and push backend
     uses: docker/build-push-action@v6
     with:
       # relative path to the place where source code with Dockerfile is located
       context: 
       # Note: tags has to be all lower-case
       tags:  ${{secrets.DOCKERHUB_USERNAME}}/tp-devops-simple-api:latest

   - name: Build image and push database
       # DO the same for database

   - name: Build image and push httpd
     # DO the same for httpd
