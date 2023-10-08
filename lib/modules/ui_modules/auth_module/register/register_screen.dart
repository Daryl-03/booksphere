import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/ui_modules/auth_module/register/register_bloc.dart';
import 'package:booksphere/modules/ui_modules/auth_module/register/register_state.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_validator/string_validator.dart';

import 'register_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
    required this.isLoginMode,
  }) : super(key: key);

  final bool isLoginMode;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _email;
  String? _password;
  String? _username;
  String? _confirmPassword;
  String? _firstName;
  String? _lastName;
  late bool _isLoginMode;
  final _formKey = GlobalKey<FormState>();
  // var _isAuthenticating = false;

  final _registerBloc = RegisterBloc();

  void _submit() {
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.reset();
    if(!_isLoginMode) {
      _registerBloc.add(
        RegisterButtonPressed(
          BooksphereUser(
            email: _email!,
            password: _password!,
            username: _username!,
            firstName: _firstName!,
            lastName: _lastName!,
          ),
        ),
      );
    } else {
      _registerBloc.add(
        LoginButtonPressed(
          _email!,
          _password!,
        ),
      );
    }
    // setState(() {
    //   _isAuthenticating = true;
    // });
  }

  @override
  void initState() {
    _isLoginMode = widget.isLoginMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutStatusBar(context);
    final theme = Theme.of(context);
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: _registerBloc,
      listener: (BuildContext context, state) {
        if (state.error != null && state.error!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
        if (state.isAuthenticating == false) {
          Navigator.of(context).pop();
        }
      },
      builder: (BuildContext context, RegisterState? state) {

        bool? isAuthenticating = state!.isAuthenticating;

        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/library.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    // top: displayHeight * 0.5,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background.withOpacity(0.9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(displayWidth * 0.1),
                          topRight: Radius.circular(displayWidth * 0.1),
                        ),
                      ),
                      height: displayHeight * 0.8,
                      width: displayWidth,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: displayWidth * 0.05,
                            right: displayWidth * 0.05,
                            top: displayHeight * 0.03,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    !_isLoginMode
                                        ? "Create an account"
                                        : "Login",
                                    style: theme.textTheme.headlineMedium!
                                        .copyWith(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: displayWidth * 0.04,
                                  ),
                                  Icon(
                                    Icons.book,
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: displayHeight * 0.03,
                              ),
                              Form(
                                key: _formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    if (!_isLoginMode)
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Username",
                                          labelStyle: theme
                                              .textTheme.bodyMedium!
                                              .copyWith(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                            borderSide: BorderSide(
                                              color: theme
                                                  .colorScheme.onBackground,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 4) {
                                            return "Please enter your username (at least 4 characters).";
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () {
                                          FocusScope.of(context).nextFocus();
                                        },
                                        onSaved: (value) {
                                          _username = value;
                                        },
                                      ),
                                    SizedBox(
                                      height: displayHeight * 0.02,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                          borderSide: BorderSide(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            !isEmail(value)) {
                                          return "Please enter a valid email address.";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _email = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: displayHeight * 0.02,
                                    ),
                                    if (!_isLoginMode) ...[
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "First name",
                                          labelStyle: theme
                                              .textTheme.bodyMedium!
                                              .copyWith(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                            borderSide: BorderSide(
                                              color: theme
                                                  .colorScheme.onBackground,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter your first name.";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _firstName = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: displayHeight * 0.02,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Last Name",
                                          labelStyle: theme
                                              .textTheme.bodyMedium!
                                              .copyWith(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                displayWidth * 0.03),
                                            borderSide: BorderSide(
                                              color: theme
                                                  .colorScheme.onBackground,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter your last name.";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _lastName = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: displayHeight * 0.02,
                                      ),
                                    ],
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                          borderSide: BorderSide(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 8) {
                                          return "Please enter your password (at least 8 characters).";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        _password = value;
                                      },
                                      onSaved: (value) {
                                        _password = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: displayHeight * 0.02,
                                    ),
                                    if(!_isLoginMode)...[
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Confirm Password",
                                        labelStyle: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              displayWidth * 0.03),
                                          borderSide: BorderSide(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 8) {
                                          return "Please enter your password (at least 8 characters).";
                                        }
                                        if (value != _password) {
                                          return "Passwords do not match.";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _password = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: displayHeight * 0.02,
                                    ),],
                                    ElevatedButton(
                                      onPressed: isAuthenticating!
                                          ? null
                                          : _submit,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: isAuthenticating
                                          ? SizedBox(
                                              height: displayHeight * 0.03,
                                              width: displayHeight * 0.03,
                                              child: CircularProgressIndicator(
                                                color: theme
                                                    .colorScheme.onBackground,
                                              ),
                                            )
                                          : Text(
                                              _isLoginMode
                                                  ? "Login"
                                                  : "Register",
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                color: theme
                                                    .colorScheme.onBackground,
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: displayHeight * 0.02,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
