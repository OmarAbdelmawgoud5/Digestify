[1mdiff --git a/lib/pages/sign_up_page.dart b/lib/pages/sign_up_page.dart[m
[1mindex 1e7795a..2df069a 100644[m
[1m--- a/lib/pages/sign_up_page.dart[m
[1m+++ b/lib/pages/sign_up_page.dart[m
[36m@@ -24,7 +24,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
   String errorMessege = "";[m
   @override[m
   void dispose() {[m
[31m-    // TODO: implement dispose[m
[32m+[m[41m    [m
     super.dispose();[m
     emailController.dispose();[m
     firstNameController.dispose();[m
[36m@@ -60,7 +60,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
         barrierDismissible: false,[m
         context: context,[m
         builder: (context) {[m
[31m-          return Center(child: CircularProgressIndicator());[m
[32m+[m[32m          return const Center(child: CircularProgressIndicator());[m
         });[m
     try {[m
       UserCredential usercredential =[m
[36m@@ -127,13 +127,13 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       ? Center([m
                           child: Text([m
                             errorMessege,[m
[31m-                            style: TextStyle([m
[32m+[m[32m                            style: const TextStyle([m
                                 color: Colors.red,[m
                                 fontSize: 18,[m
                                 fontFamily: "sf"),[m
                           ),[m
                         )[m
[31m-                      : SizedBox.shrink(),[m
[32m+[m[32m                      : const SizedBox.shrink(),[m
                 ),[m
                 const Text([m
                   "First Name",[m
[36m@@ -142,7 +142,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       fontFamily: "sf",[m
                       fontWeight: FontWeight.w700),[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 5,[m
                 ),[m
                 MyTextField([m
[36m@@ -150,7 +150,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                   obscure: false,[m
                   controller: firstNameController,[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 const Text([m
[36m@@ -160,7 +160,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       fontFamily: "sf",[m
                       fontWeight: FontWeight.w700),[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 5,[m
                 ),[m
                 MyTextField([m
[36m@@ -168,7 +168,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                   obscure: false,[m
                   controller: lastNameController,[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 const Text([m
[36m@@ -178,7 +178,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       fontFamily: "sf",[m
                       fontWeight: FontWeight.w700),[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 5,[m
                 ),[m
                 MyTextField([m
[36m@@ -186,7 +186,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                   obscure: false,[m
                   controller: emailController,[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 const Text([m
[36m@@ -196,7 +196,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       fontFamily: "sf",[m
                       fontWeight: FontWeight.w700),[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 5,[m
                 ),[m
                 MyTextField([m
[36m@@ -204,7 +204,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                   obscure: true,[m
                   controller: passwordController,[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 const Text([m
[36m@@ -214,7 +214,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       fontFamily: "sf",[m
                       fontWeight: FontWeight.w700),[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 5,[m
                 ),[m
                 MyTextField([m
[36m@@ -222,11 +222,11 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                   obscure: true,[m
                   controller: confirmPasswordController,[m
                 ),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 IntroductionButton(ontap: signUserUp, text: "Sign Up"),[m
[31m-                SizedBox([m
[32m+[m[32m                const SizedBox([m
                   height: 20,[m
                 ),[m
                 Center([m
[36m@@ -240,7 +240,7 @@[m [mclass _SignUpPageState extends State<SignUpPage> {[m
                       children: [[m
                         TextSpan([m
                           text: " Login",[m
[31m-                          style: TextStyle([m
[32m+[m[32m                          style: const TextStyle([m
                               color: Colors.blue,[m
                               fontFamily: "sf",[m
                               fontWeight: FontWeight.bold),[m
