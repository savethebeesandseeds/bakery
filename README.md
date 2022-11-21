# Waajacu Bakery
Low level server to Interpret and Handle cookies and identities. 

"Imu" means candy, in Bora.

# Educational Resources
https://www.gnu.org/software/libmicrohttpd/tutorial.html

# Requires 
- libmicrohttpd

# Run Instructions
```
[user@bar barkery]$ ./build/imu.imux
```
# Build instructions
download latest version of libmicrohttpd https://www.gnu.org/software/libmicrohttpd/
```
[user@bar ~]$ cd ./path/to/Downloads
[user@bar Downloads]$ .tar zxvf libmicrohttpd.*.tar.gz
[user@bar Downloads]$ cd ./libmicrohttpd.*
```
Install libmicrohttpd
```
[user@bar libmicrohttpd]$ ./configure 
[user@bar libmicrohttpd]$ make
[user@bar libmicrohttpd]$ sudo make install
```
Install dynamic dependencies
```
[user@bar ~]$ glibc++
[user@bar ~]$ libstdc++
```
Install static dependencies (to compile static)
```
[user@bar ~]$ glibc++-static
[user@bar ~]$ libstdc++-static
```
