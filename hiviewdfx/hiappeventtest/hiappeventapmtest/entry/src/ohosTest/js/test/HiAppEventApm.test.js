/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function HiAppEventJSTest() {
    describe('HiAppEventJSTest', () => {

        /**
         * @tc.name   testHiAppEventJs02
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0200
         * @tc.desc   验证添加数据处理者addProcessor无对应so，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs02 start');
            let processor = {
                name: 'analyticskit',
                onStartReport: true,
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                console.info(`testHiAppEventJs02 > processorId: ${processorId}`);
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs02 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs03
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0300
         * @tc.desc   验证添加数据处理者addProcessor为空字符串空，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs03 start');
            let processor = {
                name: '',
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                console.info(`testHiAppEventJs03 > processorId: ${processorId}`)
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs03 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs04
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0400
         * @tc.desc   验证removeProcessor接口移除数据处理者，processor已存在，删除成功，不存在、非法，删除失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs04 start');
            let processor = {
                name: 'analyticskit_native',
                routeInfo: 'CN',
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                console.info(`testHiAppEventJs04 > processorId: ${processorId}`)
                hiAppEvent.removeProcessor(processorId)
                hiAppEvent.removeProcessor(processorId)
                hiAppEvent.removeProcessor(-1)
                expect(true).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs04 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs05
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0500
         * @tc.desc   验证添加数据处理者addProcessor，Processor可选参数非法，调用成功，有日志打印Parameter error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs05 start');
            let config = {
                "": "",
            };
            let processor = {
                name: 'analyticskit_native',
                debugMode: false,
                routeInfo: '',
                appId: '',
                onStartReport: true,
                onBackgroundReport: true,
                periodReport: -1,
                batchReport: -2,
                userIds: [''],
                userProperties: [''],
                configId: -1,
                customConfigs: config,
                eventConfigs: [
                    {
                        domain: '',
                        name: 'testEvent',
                        isRealTime: false
                    }
                ]
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor);
                console.info(`testHiAppEventJs05 > processorId: ${processorId}`)
                hiAppEvent.removeProcessor(processorId)
                expect(true).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs05 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs06
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0600
         * @tc.desc   验证多次setUserId，用户id名与值合法，getUserId获取userid值与设置一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs06 start');
            let idName = "";
            for (let i = 0; i < 256; i++) {
                idName += 'a'
            }
            let idValue = "";
            for (let i = 0; i < 256; i++) {
                idValue += 'a'
            }
            try {
                hiAppEvent.setUserId("$", "a");
                let userIdValue1 = hiAppEvent.getUserId("$");
                expect(userIdValue1 == "a").assertTrue()
                hiAppEvent.setUserId("Ab123_$", "123");
                let userIdValue2 = hiAppEvent.getUserId("Ab123_$");
                expect(userIdValue2 == "123").assertTrue()
                hiAppEvent.setUserId(idName, idValue);
                let userIdValue3 = hiAppEvent.getUserId(idName);
                console.info(`testHiAppEventJs06 > userIdValue2: ${userIdValue3}`);
                expect(userIdValue3 == idValue).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs06 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs07
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0700
         * @tc.desc   验证setUserId，用户id名重复，用户id值更新
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs07 start');
            let processor = {
                name: 'analyticskit_native',
            }
            try {
                hiAppEvent.setUserId("testUserId", "testUserIdValue")
                hiAppEvent.setUserId("testUserId", "testUserIdValue1")
                let userIdValue = hiAppEvent.getUserId("testUserId")
                expect(userIdValue == "testUserIdValue1").assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs07 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs08
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0800
         * @tc.desc   验证setUserId，用户id值为空字符，清除用户id
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs08 start');
            let processor = {
                name: 'analyticskit_native',
            }
            try {
                hiAppEvent.setUserId("testUserId", "testUserIdValue")
                hiAppEvent.setUserId("testUserId", "")
                let userIdValue = hiAppEvent.getUserId("testUserId")
                expect(userIdValue == "").assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs08 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs09
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0900
         * @tc.desc   验证多次setUserProperty，userproperty名与值合法，getUserProperty获取userproperty值与设置一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs09 start');
            let propertyName = "";
            for (let i = 0; i < 256; i++) {
                propertyName += 'a'
            }
            let propertyValue = "";
            for (let i = 0; i < 1024; i++) {
                propertyValue += 'a'
            }
            try {
                hiAppEvent.setUserProperty("$", "a");
                let userPropertyValue1 = hiAppEvent.getUserProperty("$");
                expect(userPropertyValue1 == "a").assertTrue()
                hiAppEvent.setUserProperty("Ab123_$", "123");
                let userPropertyValue2 = hiAppEvent.getUserProperty("Ab123_$");
                expect(userPropertyValue2 == "123").assertTrue()
                hiAppEvent.setUserProperty(propertyName, propertyValue);
                let userPropertyValue3 = hiAppEvent.getUserProperty(propertyName);
                console.info(`testHiAppEventJs09 > userPropertyValue3: ${userPropertyValue3}`);
                expect(userPropertyValue3 == propertyValue).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs09 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs10
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1000
         * @tc.desc   验证多次setUserProperty，userproperty名重复，userproperty值更新
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs10 start');
            let processor = {
                name: 'analyticskit_native',
            }
            try {
                hiAppEvent.setUserProperty("testName", "testUserProperty")
                hiAppEvent.setUserProperty("testName", "testUserProperty1")
                let userPropertyValue = hiAppEvent.getUserProperty("testName")
                expect(userPropertyValue == "testUserProperty1").assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs10 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs11
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1100
         * @tc.desc   验证setUserProperty，userproperty值为空字符，清除userproperty
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs11 start');
            let processor = {
                name: 'analyticskit_native',
            }
            try {
                hiAppEvent.setUserProperty("testName", "testUserProperty")
                hiAppEvent.setUserProperty("testName", "")
                let userPropertyValue = hiAppEvent.getUserProperty("testName")
                expect(userPropertyValue == "").assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs11 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs12
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1200
         * @tc.desc   验证setUserId，用户id名为空字符串，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs12 start');
            try {
                hiAppEvent.setUserId("", "testUserIdValue")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs12 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs13
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1300
         * @tc.desc   验证setUserId，用户id名257字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs13 start');
            let idName = "";
            for (let i = 0; i < 257; i++) {
                idName += 'a'
            }
            try {
                hiAppEvent.setUserId(idName, "testUserIdValue");
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs13 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs14
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1400
         * @tc.desc   验证setUserId，用户id名数字开头，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs14 start');
            let idName = "1testUserId";
            try {
                hiAppEvent.setUserId(idName, "testUserIdValue");
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs14 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs15
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1500
         * @tc.desc   验证setUserId，用户id值长度为257字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs15 start');
            let idValue = "";
            for (let i = 0; i < 257; i++) {
                idValue += 'a'
            }
            try {
                hiAppEvent.setUserId("testUserId", idValue);
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs15 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs16
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1600
         * @tc.desc   验证setUserProperty，userproperty名为空，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs16 start');
            try {
                hiAppEvent.setUserProperty("", "userPropertyValue")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs16 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs17
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1700
         * @tc.desc   验证setUserProperty，userproperty名257字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs17 start');
            let propertyName = "";
            for (let i = 0; i < 257; i++) {
                propertyName += 'a'
            }
            try {
                hiAppEvent.setUserProperty(propertyName, "userPropertyValue")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs17 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs18
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1800
         * @tc.desc   验证setUserProperty，userproperty名数字开头，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs18 start');
            let propertyName = "1testName";
            try {
                hiAppEvent.setUserProperty(propertyName, "userPropertyValue")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs18 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs19
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1900
         * @tc.desc   验证setUserProperty，userproperty值长度为1025字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs19 start');
            let propertyValue = "";
            for (let i = 0; i < 1025; i++) {
                propertyValue += 'a'
            }
            try {
                hiAppEvent.setUserProperty("testName", propertyValue)
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs19 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs20
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2000
         * @tc.desc   验证getUserId，用户id名为空，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs20 start');
            try {
                hiAppEvent.getUserId("")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs20 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs21
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2100
         * @tc.desc   验证getUserId，用户id名257字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs21 start');
            let idName = "";
            for (let i = 0; i < 257; i++) {
                idName += 'a'
            }
            try {
                hiAppEvent.getUserId(idName);
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs21 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs22
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2200
         * @tc.desc   验证getUserId，用户id名数字开头，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs22 start');
            let idName = "1testUserId";
            try {
                hiAppEvent.getUserId(idName);
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs22 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs23
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2300
         * @tc.desc   验证getUserProperty，userproperty名为空，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs23 start');
            try {
                hiAppEvent.getUserProperty("")
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs23 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs24
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2400
         * @tc.desc   验证getUserProperty，userproperty名长度为257字节，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs24 start');
            let propertyName = "";
            for (let i = 0; i < 257; i++) {
                propertyName += 'a'
            }
            try {
                hiAppEvent.getUserProperty(propertyName)
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs24 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   testHiAppEventJs25
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2500
         * @tc.desc   验证getUserProperty，userproperty名数字开头，返回错误码401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiAppEventJs25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testHiAppEventJs25 start');
            let propertyName = "1testName";
            try {
                hiAppEvent.getUserProperty(propertyName)
                expect(false).assertTrue()
                done()
            }
            catch (err) {
                console.error(`testHiAppEventJs25 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2901
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2901
         * @tc.desc   验证添加数据处理者addProcessor-configName为异常字符串，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_DFX_DFT_HiAppEvent_Js_2901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('SUB_DFX_DFT_HiAppEvent_Js_2901 start');
            let processor = {
                name: "test_processor",
                configName: "undefined_name"
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2901 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2902
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2902
         * @tc.desc   验证添加数据处理者addProcessor-configName为异常字符串，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_DFX_DFT_HiAppEvent_Js_2902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('SUB_DFX_DFT_HiAppEvent_Js_2902 start');
            let processor = {
                name: "test_processor",
                configName: ""
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2902 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2903
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2903
         * @tc.desc   验证添加数据处理者addProcessor-configName为特殊符号，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_DFX_DFT_HiAppEvent_Js_2903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('SUB_DFX_DFT_HiAppEvent_Js_2903 start');
            let processor = {
                name: "test_processor",
                configName: "xxx***"
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2903 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2904
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2904
         * @tc.desc   验证添加数据处理者addProcessor-configName为数字开头，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_DFX_DFT_HiAppEvent_Js_2904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('SUB_DFX_DFT_HiAppEvent_Js_2904 start');
            let processor = {
                name: "test_processor",
                configName: "23_processor"
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2904 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });

        /**
         * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2905
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2905
         * @tc.desc   验证添加数据处理者addProcessor-configName为257字节，返回-1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_DFX_DFT_HiAppEvent_Js_2905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('SUB_DFX_DFT_HiAppEvent_Js_2905 start');
            let processor = {
                name: "test_processor",
                configName: 'a'.repeat(256 +1)
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                expect(processorId == -1).assertTrue()
                hiAppEvent.removeProcessor(processorId)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2905 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
        });
    })
}
