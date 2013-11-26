<?php

if(!isset($_POST["amazon_user_name"])){
    echo "-1";
    die();
}

function curl_get_html($url){
    // 使用 CURL 模拟访问
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_HEADER, 0); //设置http头
    ////curl_setopt($ch, CURLOPT_HTTPHEADER, $header);    //设置http头
    //curl_setopt($ch, CURLOPT_ENCODING, "gzip" );         //设置为客户端支持gzip压缩  
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30 ); //设置连接等待时间      
    curl_setopt($ch, CURLOPT_URL, $url);
    ob_start();//开启输出缓存;防止直接数据curl的内容
    curl_exec($ch);
    if (curl_errno($ch)) {
           // curl_error($ch);
        return false;
    }
    //Get information regarding a specific transfer
    //Last received HTTP code
    $http_code = curl_getinfo($ch,CURLINFO_HTTP_CODE);
    //页面访问失败
    if(intval($http_code) <> 200){
        return false;
    }
    curl_close($ch);
    $html = ob_get_contents();
    ob_end_clean();
    return $html;
}
/*
$self_domain = "amazon.com";
$h = curl_get_html("127.0.0.1/DyAuth(1.9)/DyAuth/DyAuthCheckUserIsLoginAPI.php?domain=".$self_domain."&user_name=".$_POST["amazon_user_name"]."&DyAuth_key=".$_POST["DyAuth_key"]);
if(intval($h) == 1) echo "1";
*/
else echo "0";//$h

//echo "1";
?>