pragma solidity >=0.7.0 <0.9.0;

contract HelloWorldContract {

    function sayHello(string memory data) pure public returns(string memory){
        return string(bytes.concat(bytes("Hello "),bytes(data)));
    }
}