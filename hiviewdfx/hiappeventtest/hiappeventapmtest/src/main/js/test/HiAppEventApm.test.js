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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function HiAppEventJSTest() {
    describe('HiAppEventJSTest', () => {

        /**
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0200
         * @tc.name testHiAppEventJs02
         * @tc.desc 验证添加数据处理者addProcessor无对应so，返回-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs02', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0300
         * @tc.name testHiAppEventJs03
         * @tc.desc 验证添加数据处理者addProcessor为空字符串空，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs03', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0400
         * @tc.name testHiAppEventJs04
         * @tc.desc 验证removeProcessor接口移除数据处理者，processor已存在，删除成功，不存在、非法，删除失败
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs04', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0500
         * @tc.name testHiAppEventJs05
         * @tc.desc 验证添加数据处理者addProcessor，Processor可选参数非法，调用成功，有日志打印Parameter error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs05', 0, async function (done) {
            console.info('testHiAppEventJs05 start');
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0600
         * @tc.name testHiAppEventJs06
         * @tc.desc 验证多次setUserId，用户id名与值合法，getUserId获取userid值与设置一致
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs06', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0700
         * @tc.name testHiAppEventJs07
         * @tc.desc 验证setUserId，用户id名重复，用户id值更新
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs07', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0800
         * @tc.name testHiAppEventJs08
         * @tc.desc 验证setUserId，用户id值为空字符，清除用户id
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs08', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_0900
         * @tc.name testHiAppEventJs09
         * @tc.desc 验证多次setUserProperty，userproperty名与值合法，getUserProperty获取userproperty值与设置一致
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs09', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1000
         * @tc.name testHiAppEventJs10
         * @tc.desc 验证多次setUserProperty，userproperty名重复，userproperty值更新
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs10', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1100
         * @tc.name testHiAppEventJs11
         * @tc.desc 验证setUserProperty，userproperty值为空字符，清除userproperty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs11', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1200
         * @tc.name testHiAppEventJs12
         * @tc.desc 验证setUserId，用户id名为空字符串，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs12', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1300
         * @tc.name testHiAppEventJs13
         * @tc.desc 验证setUserId，用户id名257字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs13', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1400
         * @tc.name testHiAppEventJs14
         * @tc.desc 验证setUserId，用户id名数字开头，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs14', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1500
         * @tc.name testHiAppEventJs15
         * @tc.desc 验证setUserId，用户id值长度为257字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs15', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1600
         * @tc.name testHiAppEventJs16
         * @tc.desc 验证setUserProperty，userproperty名为空，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs16', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1700
         * @tc.name testHiAppEventJs17
         * @tc.desc 验证setUserProperty，userproperty名257字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs17', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1800
         * @tc.name testHiAppEventJs18
         * @tc.desc 验证setUserProperty，userproperty名数字开头，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs18', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_1900
         * @tc.name testHiAppEventJs19
         * @tc.desc 验证setUserProperty，userproperty值长度为1025字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs19', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2000
         * @tc.name testHiAppEventJs20
         * @tc.desc 验证getUserId，用户id名为空，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs20', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2100
         * @tc.name testHiAppEventJs21
         * @tc.desc 验证getUserId，用户id名257字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs21', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2200
         * @tc.name testHiAppEventJs22
         * @tc.desc 验证getUserId，用户id名数字开头，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs22', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2300
         * @tc.name testHiAppEventJs23
         * @tc.desc 验证getUserProperty，userproperty名为空，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs23', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2400
         * @tc.name testHiAppEventJs24
         * @tc.desc 验证getUserProperty，userproperty名长度为257字节，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs24', 0, async function (done) {
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
         * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2500
         * @tc.name testHiAppEventJs25
         * @tc.desc 验证getUserProperty，userproperty名数字开头，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiAppEventJs25', 0, async function (done) {
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
    })
}