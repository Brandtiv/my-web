docker build -t my-web:latest .
docker run --name my-web -it --rm -p 80:80 my-web:latest
