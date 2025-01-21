/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import hilog from '@ohos.hilog'
// @ts-ignore
import hilogndk from "libhilogndk.so"

export default function HilogJsTest() {
describe('HilogJsTest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        console.info('afterAll called');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0100
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi01', 2, function () {
        console.info('testHilogJsApi01 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ['hilogJs0100'])
        } catch (error){
            console.log(`testHilogJsApi01 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi01 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0200
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi02', 2, function () {
        console.info('testHilogJsApi02 start');
        try{
            hilog.error(0x3200, "HILOGTEST", "%{public}s", ['hilogJs0200'])
        } catch (error){
            console.log(`testHilogJsApi02 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi02 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0300
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi03', 2, function () {
        console.info('testHilogJsApi03 start');
        try{
            hilog.fatal(0x3200, "HILOGTEST", "%{public}s", ['hilogJs0300'])
        } catch (error){
            console.log(`testHilogJsApi03 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi03 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0400
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi04', 2, function () {
        console.info('testHilogJsApi04 start');
        try{
            hilog.info(0x3200, "HILOGTEST", "%{public}s", ['hilogJs0400'])
        } catch (error){
            console.log(`testHilogJsApi04 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi04 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0500
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi05', 2, function () {
        console.info('testHilogJsApi04 start');
        try{
            hilog.warn(0x3200, "HILOGTEST", "%{public}s", ['hilogJs0500'])
        } catch (error){
            console.log(`testHilogJsApi05 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi05 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0600
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi06', 2, function () {
        console.info('testHilogJsApi06 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi06 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0700
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi07', 2, function () {
        console.info('testHilogJsApi07 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
        var tag = "";
        for (var i = 0; i < 1000; i++){
            tag += "HILOGTEST"
        }
        expect(res).assertEqual(true);
        console.info('testHilogJsApi07 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0800
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi08', 2, function () {
        console.info('testHilogJsApi08 start');
        const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi08 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1100
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi09', 2, function () {
        console.info('testHilogJsApi09 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.ERROR);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi09 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1200
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi10', 2, function () {
        console.info('testHilogJsApi10 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi10 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1300
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi11', 2, function () {
        console.info('testHilogJsApi11 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi11 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1400
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi12', 2, function () {
        console.info('testHilogJsApi12 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi12 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1500
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi13', 2, function () {
        console.info('testHilogJsApi13 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", 100);
        expect(res).assertEqual(false);
        console.info('testHilogJsApi13 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1600
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi14', 2, function () {
        console.info('testHilogJsApi14 start');
        const res = hilog.isLoggable(0, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi14 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_01700
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi15', 2, function () {
        console.info('testHilogJsApi15 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi15 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1800
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi16', 2, function () {
        console.info('testHilogJsApi16 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ['hilogJs1800'])
        }catch(error){
            console.log(`testHilogJsApi16 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi16 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2100
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi17', 2, function () {
        console.info('testHilogJsApi17 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}d", [2.1])
        }catch(error){
            console.log(`testHilogJsApi17 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi17 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2500
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi18', 2, function () {
        console.info('testHilogJsApi18 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}d", [65535])
        }catch(error){
            console.log(`testHilogJsApi18 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi18 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2600
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi19', 2, function () {
        console.info('testHilogJsApi19 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ["hilog info"])
        }catch(error){
            console.log(`testHilogJsApi19 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi19 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2900
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi20', 2, function () {
        console.info('testHilogJsApi20 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}d", [2147483647])
        }catch(error){
            console.log(`testHilogJsApi20 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi20 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3000
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi21', 2, function () {
        console.info('testHilogJsApi21 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ["100%s%d%x%f"])
        }catch(error){
            console.log(`testHilogJsApi21 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi21 end');
    })


    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3200
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi22', 2, function () {
        console.info('testHilogJsApi22 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ["65536"])
        }catch(error){
            console.log(`testHilogJsApi22 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi22 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3300
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi23', 2, function () {
        console.info('testHilogJsApi23 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", ["username", "password"])
            hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", ["username123", "password"])
        }catch(error){
            console.log(`testHilogJsApi23 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi23 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3400
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi24', 2, function () {
        console.info('testHilogJsApi24 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", ["hilog public"])
        }catch(error){
            console.log(`testHilogJsApi24 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi24 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3500
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi25', 2, function () {
        console.info('testHilogJsApi25 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{nopublic}s", ["Hilogtest"])
        }catch(error){
            console.log(`testHilogJsApi25 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi25 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3800
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi26', 2, function () {
        console.info('testHilogJsApi26 start');
        try{
            hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", ["username", "password"])
            hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", ["username123", "password"])
        }catch(error){
            console.log(`testHilogJsApi26 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi26 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3900
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
    it('testHilogJsApi27', 2, function () {
        console.info('testHilogJsApi27 start');
        const res = hilogndk.ohIsLoggableTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi27 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4000
     * @tc.name hitrace interface test
     * @tc.desc hitrace begin interface test.
     */
     it('testHilogJsApi28', 2, function () {
        console.info('testHilogJsApi28 start');
        const res = hilogndk.ohPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi28 end');
    })
})
}
