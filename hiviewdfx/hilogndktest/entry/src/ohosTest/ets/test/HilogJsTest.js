/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
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
        hilog.setMinLogLevel(hilog.LogLevel.INFO);
        console.info('afterAll called');
    })

    /**
     * @tc.name   testHilogJsApi01
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi01 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
        } catch (error){
            console.log(`testHilogJsApi01 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi01 end');
    })

    /**
     * @tc.name   testHilogJsApi02
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi02 start');
      try{
        hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0200')
      } catch (error){
        console.log(`testHilogJsApi02 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi02 end');
    })

    /**
     * @tc.name   testHilogJsApi03
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi03 start');
      try{
        hilog.fatal(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0300')
      } catch (error){
        console.log(`testHilogJsApi03 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi03 end');
    })

    /**
     * @tc.name   testHilogJsApi04
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi04 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0400')
      } catch (error){
        console.log(`testHilogJsApi04 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi04 end');
    })

    /**
     * @tc.name   testHilogJsApi05
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi04 start');
      try{
        hilog.warn(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0500')
      } catch (error){
        console.log(`testHilogJsApi05 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi05 end');
    })

    /**
     * @tc.name   testHilogJsApi06
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0600
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi06 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi06 end');
    })

    /**
     * @tc.name   testHilogJsApi07
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0700
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
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
     * @tc.name   testHilogJsApi08
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0800
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi08 start');
        const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi08 end');
    })

    /**
     * @tc.name   testHilogJsApi09
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1100
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi09 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.ERROR);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi09 end');
    })

    /**
     * @tc.name   testHilogJsApi10
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1200
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi10 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi10 end');
    })

    /**
     * @tc.name   testHilogJsApi11
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1300
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi11 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi11 end');
    })

    /**
     * @tc.name   testHilogJsApi12
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1400
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi12 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi12 end');
    })

    /**
     * @tc.name   testHilogJsApi13
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1500
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi13 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", 100);
        expect(res).assertEqual(false);
        console.info('testHilogJsApi13 end');
    })

    /**
     * @tc.name   testHilogJsApi14
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1600
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi14 start');
        const res = hilog.isLoggable(0, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi14 end');
    })

    /**
     * @tc.name   testHilogJsApi15
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_01700
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi15 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi15 end');
    })

    /**
     * @tc.name   testHilogJsApi16
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1800
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi16 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", 'hilogJs1800')
      }catch(error){
        console.log(`testHilogJsApi16 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi16 end');
    })

    /**
     * @tc.name   testHilogJsApi17
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi17 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 2.1)
      }catch(error){
        console.log(`testHilogJsApi17 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi17 end');
    })

    /**
     * @tc.name   testHilogJsApi18
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi18 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 65535)
      }catch(error){
        console.log(`testHilogJsApi18 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi18 end');
    })

    /**
     * @tc.name   testHilogJsApi19
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi19 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "hilog info")
      }catch(error){
        console.log(`testHilogJsApi19 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi19 end');
    })

    /**
     * @tc.name   testHilogJsApi20
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi20 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 2147483647)
      }catch(error){
        console.log(`testHilogJsApi20 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi20 end');
    })

    /**
     * @tc.name   testHilogJsApi21
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi21 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "100%s%d%x%f")
      }catch(error){
        console.log(`testHilogJsApi21 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi21 end');
    })

    /**
     * @tc.name   testHilogJsApi22
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi22 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "65536")
      }catch(error){
        console.log(`testHilogJsApi22 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi22 end');
    })

    /**
     * @tc.name   testHilogJsApi23
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi23 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", "username", "password")
        hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", "username123", "password")
      }catch(error){
        console.log(`testHilogJsApi23 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi23 end');
    })

    /**
     * @tc.name   testHilogJsApi24
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi24 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "hilog public")
      }catch(error){
        console.log(`testHilogJsApi24 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi24 end');
    })

    /**
     * @tc.name   testHilogJsApi25
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi25 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{nopublic}s", "Hilogtest")
      }catch(error){
        console.log(`testHilogJsApi25 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi25 end');
    })

    /**
     * @tc.name   testHilogJsApi26
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi26 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", "username", "password")
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", "username123", "password")
      }catch(error){
        console.log(`testHilogJsApi26 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi26 end');
    })

    /**
     * @tc.name   testHilogJsApi27
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi27 start');
      try{
        hilog.info(0xffff, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi27 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi27 end');
    })

    /**
     * @tc.name   testHilogJsApi28
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi28 start');
      try{
        hilog.info(0xfffe, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi28 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi28 end');
    })

    /**
     * @tc.name   testHilogJsApi29
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi29 start');
      try{
        hilog.info(0xfffff, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi29 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi29 end');
    })

    /**
     * @tc.name   testHilogJsApi30
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi30 start');
      try{
        hilog.info(0xffffe, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi30 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi30 end');
    })

    /**
     * @tc.name   testHilogJsApi31
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi31 start');
      try{
        // @ts-ignore
        hilog.info("中文domainId", "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi31 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi31 end');
    })

    /**
     * @tc.name   testHilogJsApi32
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi32 start');
      try{
        hilog.info(100, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi32 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi32 end');
    })

    /**
     * @tc.name   testHilogJsApi33
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi33 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s.", null)
      }catch(error){
        console.log(`testHilogJsApi33 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi33 end');
    })

    /**
     * @tc.name   testHilogJsApi34
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi34 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s.", undefined)
      }catch(error){
        console.log(`testHilogJsApi34 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi34 end');
    })

    /**
     * @tc.name   testHilogJsApi35
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi35 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "MAX Number:%{public}d, MIN Number:%{public}d", Number.MAX_VALUE, Number.MIN_VALUE)
      }catch(error){
        console.log(`testHilogJsApi35 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi35 end');
    })

    /**
     * @tc.name   testHilogJsApi36
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi36 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "中文测试:%{public}s, 混合打印:%{public}s", "中文打印测试", "for中文test,.;:*_-=^(%)?#$/|\\")
      }catch(error){
        console.log(`testHilogJsApi36 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi36 end');
    })

    /**
     * @tc.name   testHilogJsApi37
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi37 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "boolean1:%{public}s, boolean2:%{public}s", true, false)
      }catch(error){
        console.log(`testHilogJsApi37 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi37 end');
    })

    /**
     * @tc.name   testHilogJsApi38
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi38 start');
      const res = hilog.isLoggable(100, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi38 end');
    })

    /**
     * @tc.name   testHilogJsApi39
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi39 start');
      const res = hilog.isLoggable(0xfffff, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      console.info('testHilogJsApi39 end');
    })

    /**
     * @tc.name   testHilogJsApi40
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi40 start');
      const res = hilog.isLoggable(0xffff, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi40 end');
    })

    /**
     * @tc.name   testHilogJsApi41
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi41 start');
      const res = hilog.isLoggable(0xfffe, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi41 end');
    })

    /**
     * @tc.name   testHilogJsApi42
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi42 start');
      const res = hilog.isLoggable(0x123456789, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      console.info('testHilogJsApi42 end');
    })

    /**
     * @tc.name   testHilogJsApi43
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi43 start');
      // @ts-ignore
      const res = hilog.isLoggable("中文测试", "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(undefined);
      console.info('testHilogJsApi43 end');
    })
	
    /**
     * @tc.name   testHilogJsApi44
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi44 start');
        const res = hilogndk.ohIsLoggableTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi44 end');
    })

    /**
     * @tc.name   testHilogJsApi44_1
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5800
     * @tc.desc   hilog ohIsLoggableTestFalse begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi44_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi44_1 start');
      const res = hilogndk.ohIsLoggableTestFalse();
      expect(res).assertEqual(false);
      console.info('testHilogJsApi44_1 end');
    })

     /**
      * @tc.name   testHilogJsApi45
      * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5900
      * @tc.desc   hilog begin interface test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testHilogJsApi45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi45 start');
        const res = hilogndk.ohPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi45 end');
    })
    
    /**
     * @tc.name   testHilogJsApi46
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0100
     * @tc.desc   验证nativie层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi46 start');
        try{
            let sum = hilogndk.add(2,3)
            expect(sum).assertEqual(6);

            let msg = hilogndk.getMsg()
            expect(msg).assertContain("666666");
            console.log(`testHilogJsApi46 msg: ${msg}`)
        }catch(error){
            console.log(`testHilogJsApi46 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi46 end');
    })

    /**
     * @tc.name   testHilogJsApi47
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0200
     * @tc.desc   验证js层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi47 start');
        try{
            let sum = hilogndk.add(2,3)

            hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
            let msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0100");
            console.log(`testHilogJsApi47 msg -1: ${msg}`)

            hilog.warn(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0200')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0200");
            console.log(`testHilogJsApi47 msg -2: ${msg}`)

            hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0300')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0300");
            console.log(`testHilogJsApi47 msg -3: ${msg}`)

            hilog.fatal(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0400')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0400");
            console.log(`testHilogJsApi47 msg -4: ${msg}`)

        }catch(error){
            console.log(`testHilogJsApi47 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }

        console.info('testHilogJsApi47 end');
    })

    /**
     * @tc.name   testHilogJsApi48
     * @tc.number testHilogJsApi48
     * @tc.desc   testHilogJsApi48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi48 start');
        const res = hilogndk.ohPrintMsgTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi48 end');
    })
    
    /**
     * @tc.name   testHilogJsApi49
     * @tc.number testHilogJsApi49
     * @tc.desc   testHilogJsApi49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi49 start');
        const res = hilogndk.ohPrintMsgByLenTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi49 end');
    })
	
    /**
     * @tc.name   testHilogJsApi50
     * @tc.number testHilogJsApi50
     * @tc.desc   testHilogJsApi50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi50 start');
        const res = hilogndk.ohVPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi50 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0100
     * @tc.number SUB_DFX_DFT_DefaultLevel_0100
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0200
     * @tc.number SUB_DFX_DFT_DefaultLevel_0200
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.WARN);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0300
     * @tc.number SUB_DFX_DFT_DefaultLevel_0300
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0400
     * @tc.number SUB_DFX_DFT_DefaultLevel_0400
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.ERROR);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0500
     * @tc.number SUB_DFX_DFT_DefaultLevel_0500
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0600
     * @tc.number SUB_DFX_DFT_DefaultLevel_0600
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      try{
        for (let index = 0; index < 1000; index++) {
          hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
          hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
        }
      } catch (error){
        console.log(`testHilogJsApi01 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1700
     * @tc.number SUB_DFX_DFT_DefaultLevel_1700
     * @tc.desc   hilog新增向下调整日志级别接口-使用默认日志级别setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.UNSET_LOGLEVEL)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(true);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1800
     * @tc.number SUB_DFX_DFT_DefaultLevel_1800
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较大值setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.PREFER_CLOSE_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1900
     * @tc.number SUB_DFX_DFT_DefaultLevel_1900
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较小值setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.PREFER_OPEN_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(true);
      expect(res1).assertEqual(true);
    })
    
    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2400
     * @tc.number SUB_DFX_DFT_DefaultLevel_2400
     * @tc.desc   hilog调整日志级别接口后执行setMinLogLevel方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.ERROR, hilog.PreferStrategy.PREFER_CLOSE_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
      hilog.setMinLogLevel(hilog.LogLevel.WARN)
      let res2 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
      let res3 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res2).assertEqual(true);
      expect(res3).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2000
     * @tc.number SUB_DFX_DFT_DefaultLevel_2000
     * @tc.desc   hilog新增向下调整日志级别接口-使用默认日志级别OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info('SUB_DFX_DFT_DefaultLevel_2000 start');
        const res = hilogndk.ohSetLogLevelTest1();
        expect(res).assertEqual(true);
        console.info('SUB_DFX_DFT_DefaultLevel_2000 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2100
     * @tc.number SUB_DFX_DFT_DefaultLevel_2100
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较大值OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('SUB_DFX_DFT_DefaultLevel_2100 start');
      const res = hilogndk.ohSetLogLevelTest2();
      expect(res).assertEqual(true);
      console.info('SUB_DFX_DFT_DefaultLevel_2100 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2200
     * @tc.number SUB_DFX_DFT_DefaultLevel_2200
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较小值OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('SUB_DFX_DFT_DefaultLevel_2200 start');
      const res = hilogndk.ohSetLogLevelTest3();
      expect(res).assertEqual(true);
      console.info('SUB_DFX_DFT_DefaultLevel_2200 end');
    })
  })
}
