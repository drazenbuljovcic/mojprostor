<?php

function checkData($email, $password, $first_name, $last_name)
{
    $status["status"]="";
    $status["error"]=false;

    if(isValidEmail($email))
    {
        $status["status"]["email"]="ok";
    }
    else 
    {
        $status["status"]["email"] ="Email not valid";
        $status["error"] =  true;
    }
    if(strlen($password)>6)
    {
        $status["status"]["password"]= "ok";
    }
    else
    {
        $status["status"]["password"]="Password not valid";
        $status["error"] = true;
    }

    if(strlen($first_name)>6)
    {
        $status["status"]["first_name"]="ok";
    }
    else
    {
        $status["status"]["first_name"]="First name not valid";
        $status["error"] = true;
    }

    if(strlen($last_name)>6)
    {
        $status["status"]["last_name"]= "ok";
    }
    else 
    {
        $status["status"]["last_name"] ="First name not valid";
        $status["error"] = true;
    }
    


    return $status;
}

function isValidEmail($email)
{
    if (filter_var($email, FILTER_VALIDATE_EMAIL)!==false)
    {
        return true;
    }
    else
    {
        return false;
    }
}