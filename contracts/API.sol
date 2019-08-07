pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract API {
    // 문자열을 반환
    function responseString() public pure returns (string) {
        return '문자열!!!';
    }
    function responseInteger() public pure returns (int) {
        return 7;
    }
    function requestString(string value) public pure returns (string) {
        return value;
    }
    function requestInteger(uint value) public pure returns (uint) {
        return value;
    }
    string[] names;
    function addName(string name) public returns(bool) {
        names.push(name);
        return true;
    }
    function getNames() public returns (string[]) {
        return names;
    }

    struct User {
        string name;
        uint id;
    }
    mapping(address => User) user_map;
    address[] users;

    function getUserCount() public view returns (uint) {
        return users.length;
    }
    function addUser(string name) public {
        // require (user_map[msg.sender].id > 0)
        if(user_map[msg.sender].id > 0) {
            return;
        }
        users.push(msg.sender);
        User u;
        u.name = name;
        u.id = 100;
        user_map[msg.sender] = u;
    }
    function getUser(address sender) public returns(string, uint){
        //msg.sender
        User u =user_map[sender];
        return(u.name, u.id);
    }

    // 구조체
    struct Person {
        string name;
        uint age;
    }   // array 또는 map 자료와 같이 사용, 일반적
    Person[] persons; // 배열
    mapping(uint => Person) person_map;
    function test() public {
        Person p;
        p.name = 'a';
        p.age = 30;
        persons.push(p);
        person_map[0] = p;
        // person_map.put(key, value);
    }
}