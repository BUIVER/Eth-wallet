//
//  RegisterClientModel.swift
//  1223
//
//  Created by Ivan Ermak on 4/24/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import Foundation
import Web3Swift
//import web3swift
/*
import BigInt
class Client {
 
    func register() {
       
   /*     if let url = URL(string: "localhost: 8900"){
            if let web3 = Web3(url: url) {
            let address = Address("0xd68bEF63B58efB50c4A4B8625f7336ad73952Dba")
                do {
                    let instance = try Web3Contract.init(web3: web3, abiString: abi, at: address, options: nil)
                    let web3provider = Web3HttpProvider.self
                    let web3Eth = Web3Eth.init(provider: web3provider as! Web3Provider, web3: web3)
                    Web3Eth.init(provider: <#T##Web3Provider#>, web3: <#T##Web3#>)
                    let login = "login"
                    try instance.method("authAddress", parameters: [login],  extraData: Data(), options: nil)
                    
                    Web3.Eth.call(Web3Eth)
                    _ = Web3.Eth.call(web3Eth)
                    var message = "secret"
                    Web3.Utils.sha3(Data)
                    let test = Web3.Eth.getAccounts(Web3Eth())
                    instance.
                    Web3.Eth.sign
                } catch {fatalError("Error of Contract init")}
                
            }
        }*/
    }
    func createAccount () {
        let webRink = Web3(infura: .rinkeby)
        var gasPrice: BigUInt
        do {
            gasPrice = try webRink.eth.getGasPrice()
            
        } catch {fatalError("uuuuuu")}
        
        //if let url = URL(string: "http://127.0.0.1:8545"){
            
          //  if let provider = Web3HttpProvider(url) {
                
                
                let web3 = Web3(infura: .rinkeby, accessToken: "ad969fc9b47c4f2494ce82defbc3bcac")
                //let web3 = Web3(provider: provider)
                debugPrint("infura initiated")
                var web3Options = Web3Options()
                web3Options.gasLimit = 94498
                web3Options.gasPrice = gasPrice
                web3Options.value = 0
            let address = Address("0xe978736aD2b1A5663dBB11072De7BFEB7d05ED99")
            do {
            
                let instance = try Web3Contract.init(web3: web3, abiString: abi, at: address, options: web3Options)
                debugPrint("instance created")
                do {
                    
                let txIntermediate = try instance.method("createAccount", parameters: ["0x4e75f905Baea6751B224190Fa7cd7FFc87D52043"], extraData: Data(), options: web3Options)
                    debugPrint("method created")
                    _ = txIntermediate.sendPromise(password: "260199Vv", options: web3Options, onBlock: "latest")
                        .done({data in
                            debugPrint("promise realized")
                        let address = data.transaction.description
                        print(data)
                    })
                    debugPrint("promise created")
                }
                catch {fatalError("error of instance method")}
            }
            catch {fatalError("error of instance init")}
            
        }
    //    else {debugPrint("Error if Web3 init")}
        
      //  }
   // }
}*/
class ClientOperations {
    func createAccount(login: String, password: String) {
        let infura = InfuraNetwork.init(chain: "rinkeby", apiKey: "ad969fc9b47c4f2494ce82defbc3bcac")
        let data = Data(base64Encoded: password)
        let sha3 = "Create(string login)"
        let signature = sha3.sha3(.keccak256)
        let signData = Data(base64Encoded: signature)
        let str: HexString = HexString(hex: login)
        if let sign = signData?.toHexString() {
            if let parsedString = data?.toHexString() {
                let privateKey: PrivateKey = EthPrivateKey(hex: parsedString)
                let parameter = ABIString(origin: str)
                    do {
                        let transaction = SendRawTransactionProcedure(network: infura, transactionBytes: EthContractCallBytes(network: infura, senderKey: privateKey, contractAddress: EthAddress(hex: "0xe978736aD2b1A5663dBB11072De7BFEB7d05ED99"), weiAmount: EthNumber(hex: "0x00"), functionCall: EncodedABIFunction(signature: sign, parameters: [parameter])))
                        debugPrint(transaction)
                        let result = try transaction.call()
                        debugPrint(result)
                    }
                        
                    catch {debugPrint(error)}
                
            }
        }
    }
    func signIn(login: String, password: String) {
        let infura = InfuraNetwork.init(chain: "rinkeby", apiKey: "ad969fc9b47c4f2494ce82defbc3bcac")
        let data = Data(base64Encoded: password)
        let sha3 = "Create(string login)"
        let signature = sha3.sha3(.keccak256)
        let signData = Data(base64Encoded: signature)
        let str: HexString = HexString(hex: login)
        if let sign = signData?.toHexString() {
            if let parsedString = data?.toHexString() {
                let privateKey: PrivateKey = EthPrivateKey(hex: parsedString)
                let parameter = ABIString(origin: str)
                do {
                    let transaction = SendRawTransactionProcedure(network: infura, transactionBytes: EthContractCallBytes(network: infura, senderKey: privateKey, contractAddress: EthAddress(hex: "0xe978736aD2b1A5663dBB11072De7BFEB7d05ED99"), weiAmount: EthNumber(hex: "0x00"), functionCall: EncodedABIFunction(signature: sign, parameters: [parameter])))
                    debugPrint(transaction)
                    let result = try transaction.call()
                    debugPrint(result)
                }
                    
                catch {debugPrint(error)}
                
            }
        }
    }
}

/*
 [{"constant":true,"inputs":[{"name":"_login","type":"bytes32"}],"name":"recoveryAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_login","type":"bytes32"}],"name":"authAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_login","type":"bytes32"},{"name":"_addr","type":"address"}],"name":"setRecoveryAddress","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_login","type":"bytes32"},{"name":"_addr","type":"address"}],"name":"setAuthAddress","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_login","type":"bytes32"}],"name":"dropAccount","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_login","type":"bytes32"}],"name":"createAccount","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]
*/
//0x4e75f905Baea6751B224190Fa7cd7FFc87D52043
