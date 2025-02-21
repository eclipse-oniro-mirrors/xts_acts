/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import pasteboard from '@ohos.pasteboard'

let error = undefined;

const  ARRAY_BUFFER = new ArrayBuffer(256)

export default function pasteBoardSystemPasteBoardTest(){
    describe('pasteBoardSystemPasteBoardTest', function() {
        console.info('start################################start');
        beforeEach(function() {
            error = undefined;
        })

		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100
         * @tc.name      clearData
         * @tc.desc      Clear the data in the system pasteBoard
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100', 0, async function (done) {
          console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100 start")
          let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
          let systemPasteBoard = pasteboard.getSystemPasteboard();
          await systemPasteBoard.setData(pasteData)
          await systemPasteBoard.clearData(async (err, data) => {
            console.info("Clear the data in the system pasteBoard finished")
            await systemPasteBoard.hasData().then((data) => {
                console.info(`Succeeded in checking the PasteData. Data: ${data}`);
                expect(data).assertEqual(false);
                done();
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100 end")
            })
          })
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200
         * @tc.name      clearData
         * @tc.desc      Clear the data in the system pasteBoard fail,type of parameter "callback" is string
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function clear(callback){
                systemPasteBoard.clearData(callback)
            }
            try{
                clear("callback")
            }catch(err){
                console.info("Clear the data in the system pasteBoard error,error code: " + err.code)
                error = err;
                expect(err.code).assertEqual("401")
            }
            expect(error != undefined).assertTrue();
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100
         * @tc.name      clearData
         * @tc.desc      Clear the data in the system pasteBoard
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.hasData().then(async (data) => {
                    expect(data).assertTrue();
                    await systemPasteBoard.clearData().then(async () =>{
                        console.info("Clear the data in the system pasteBoard success")
                            await systemPasteBoard.hasData().then((data) => {
                                expect(data).assertEqual(false);
                            })
                    }).catch((err) => {
                        console.info("Clear the data in the system pasteBoard error,error: " + err)
                        expect(false).assertTrue();
                    })
                }).catch(err => {
                    console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                    expect(false).assertTrue();
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100
         * @tc.name     getData
         * @tc.desc      get the pastedata from system pasteBoard success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.getData((err, data) => {
                    if(err != null){
                        console.info("Get the pastedata from system pasteboard failed" + err)
                        expect(false).assertTrue();
                    }else{
                        let recordCount = data.getRecordCount()
                        expect(recordCount).assertEqual(1)
                    }
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200
         * @tc.name     getData
         * @tc.desc      get the pastedata from system pasteBoard fail,type of parameter "callback" is string
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function getData(callback){
                systemPasteBoard.getData(callback)
            }
            try{
                getData("callback")
            }catch(err){
                console.info("Get the pastedata from system pasteBoard fail,error code: " + err.code)
                error = err;
                expect(err.code).assertEqual("401")
            }
            expect(error != undefined).assertTrue
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100
         * @tc.name     getData
         * @tc.desc      get the pastedata from system pasteBoard success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.getData().then(async (data) => {
                    console.info("Get the pastedata from system pasteboard success")
                    let recordCount = data.getRecordCount()
                    expect(recordCount).assertEqual(1)
                }).catch((err) => {
                    console.info("Get the pastedata from system pasteboard failed" + err)
                    expect(false).assertTrue();
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100
         * @tc.name     hasData
         * @tc.desc      Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.hasData((err, data) => {
                    if(err != undefined){
                        console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                        expect(false).assertTrue();
                    }else{
                        expect(data).assertTrue();
                    }
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200
         * @tc.name     hasData
         * @tc.desc      Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clearData().then(async() => {
                await systemPasteBoard.hasData((err, data) => {
                    if(err != undefined){
                        console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                        expect(false).assertTrue();
                    }else{
                        expect(data == false).assertTrue();
                    }
                })
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200
         * @tc.name     hasData
         * @tc.desc      Determine if there is data in the system pasteboard fail,type of parameter "callback" is string
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function hasData( callback){
                systemPasteBoard.hasData(callback)
            }
            try{
                hasData("callback")
            }catch(err){
                console.info("Judge whether there is data in the system pasteBoard error,error code: " + err.code)
                error = err;
                expect(err.code).assertEqual("401")
            }
            expect(error != undefined).assertTrue();
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100
         * @tc.name     hasData
         * @tc.desc      Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.hasData().then((data) => {
                    expect(data).assertTrue();
                }).catch(err => {
                    console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                    expect(false).assertTrue();
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200
         * @tc.name     hasData
         * @tc.desc      Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clearData().then(async() => {
                await systemPasteBoard.hasData().then((data) => {
                    expect( data == false).assertTrue();
                }).catch(err => {
                    console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                    expect(false).assertTrue();
                })
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData, async (err, data) =>{
                if(err != null){
                    console.info("System pasteBoard set pastedata error,error: " + err)
                    expect(false).assertTrue();
                }else{
                    await systemPasteBoard.hasData().then((data) => {
                        expect(data).assertTrue();
                    }).catch(err => {
                        console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                        expect(false).assertTrue();
                    })
                }
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string 
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            async function setData( pasteData, callBack){
                await systemPasteBoard.setData(pasteData, callBack)
            }
            try{
                await setData("pasteData", async (err, data) =>{
                    if(err != null){
                        console.info("System pasteBoard set pastedata error,error: " + err)
                        expect(err.code).assertEqual("401");
                    }else{
                        expect(false).assertTrue();
                    }
                })
            }catch(err){
                console.info("System pasteBoard set pastedata error,error: " + err)
                        expect(err.code).assertEqual("401");
            }
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string 
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function setData( pasteData, callBack){
                systemPasteBoard.setData(pasteData, callBack)
            }
            try{
                setData("pasteData", "callback")
            }catch(err){
                console.info("Put pastedata to system pasteBoard fail,error code: " + err.code)
                error = err;
                expect(err.code).assertEqual("401")
            }
            expect(error != undefined).assertTrue();
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.setData(pasteData).then(async () => {
                await systemPasteBoard.hasData().then((data) => {
                    expect(data).assertTrue();
                }).catch(err => {
                    console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
                    expect(false).assertTrue();
                })
            }).catch(err => {
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(false).assertTrue();
            })
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string 
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function setData( pasteData){
                systemPasteBoard.setData(pasteData)
            }
            try{
                setData("pasteData")
            }catch(err){
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(err.code).assertEqual("401");
            }
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200 end")
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300
         * @tc.name     setData
         * @tc.desc      Put pastedata to system pasteBoard fail without parameters
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            function setData(func, pasteData){
                func()
            }
            try{
                setData(systemPasteBoard.setData,"pasteData")
            }catch(err){
                console.info("System pasteBoard set pastedata error,error: " + err)
                expect(err.code).assertEqual("401");
            }
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300 end")
            done();
        })
    });
}
