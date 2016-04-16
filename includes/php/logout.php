<?php

session_start();
session_destroy();

if(empty($_SESSION["email"]) and empty($_SESSION["password"]))
{
    $record["status"]="Uspešno ste izlogovani!";

    $send_back=json_encode($record);

    echo $send_back;
}
else
{
    $record["status"]="Greška tokom logouta!";

    $send_back=json_encode($record);

    echo $send_back;
}