 echo ============= test1 ==============
 echo ======== commande simple =========
bash tests/./test1.sh>tests/outputbash
./42sh tests/test1.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test2 ==============
echo ========== commandes complexes ==== 
bash tests/./test2.sh>tests/outputbash
./42sh tests/test2.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test3 ==============
echo =============== if ================
bash tests/./test3.sh>tests/outputbash
./42sh tests/test3.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test4 ==============
echo ======== if imbriqués =============
bash tests/./test4.sh>tests/outputbash
./42sh tests/test4.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test5 ==============
echo ========= pipe simple =============
bash tests/./test5.sh>tests/outputbash
./42sh tests/test5.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test6 ==============
echo ========= ascii house =============
bash tests/./test6.sh>tests/outputbash
./42sh tests/test6.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test7 ==============
echo ========= ascii house + ls =============
bash tests/./test7.sh>tests/outputbash
diff tests/outputbash tests/output42sh
echo ============== test8 ==============
echo ========= commentaire ============
bash tests/./test8.sh>tests/outputbash
./42sh tests/test8.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test9 ==============
echo ========= echo + commentaire ============
bash tests/./test9.sh>tests/outputbash
./42sh tests/test9.sh>tests/output42sh
diff tests/outputbash tests/output42sh
echo ============== test10 ==============
echo ========= $ USER ============
bash tests/./test10.sh>tests/outputbash
./42sh tests/test10.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test11 ============== 
echo ========= variable + 1 ============
bash tests/./test11.sh>tests/outputbash
./42sh tests/test11.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test12 ==============
echo ========= simple addition ============
bash tests/./test12.sh>tests/outputbash
./42sh tests/test12.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test13 ==============
echo ========= simple division ============
bash tests/./test13.sh>tests/outputbash
./42sh tests/test13.sh>tests/output42sh
iff tests/outputbash tests/output42sh 
echo ============== test14 ==============
echo ========= simple multiplication ============
bash tests/./test14.sh>tests/outputbas
./42sh tests/test14.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test15 ==============
echo ========= Hello + Name give an argument ============
bash tests/./test15.sh>tests/outputbas
./42sh tests/test15.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test16 ==============
echo ========= loop for ============
bash tests/./test16.sh>tests/outputbas
./42sh tests/test16.sh>tests/output42sh 
iff tests/outputbash tests/output42sh
echo ============== test17 ============== 
echo ========= loop while + counter ============
bash tests/./test17.sh>tests/outputbas
./42sh tests/test17.sh>tests/output42sh
iff tests/outputbash tests/output42sh 
echo ============== test18 ============== 
echo ========= until ============
bash tests/./test18.sh>tests/outputbas
./42sh tests/test18.sh>tests/output42sh
iff tests/outputbash tests/output42sh
echo ============== test19 ============== 
echo ========= loop for + loop for ============
bash tests/./test19.sh>tests/outputbas
./42sh tests/test19.sh>tests/output42sh
iff tests/outputbash tests/output42sh 
echo ============== test20 ==============
echo ========= operator AND ============
bash tests/./test20.sh>tests/outputbas
./42sh tests/test20.sh>tests/output42s
iff tests/outputbash tests/output42s
