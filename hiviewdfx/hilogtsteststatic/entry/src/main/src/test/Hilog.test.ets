/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HILOG_ANI_TEST'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HilogTsTest() {
  describe('HilogTsTest', (): void => {
    beforeAll(():void => {
      hilog.info(domain, tag, 'beforeAll called');
    })

    afterAll(():void => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      hilog.info(domain, tag, 'afterAll called');
    })

    /**
     * @tc.name   testHilogTsApiStatic01
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic01 start');
      try{
        hilog.debug(0x0000, tag, "%{public}s", 'testHilogTsApiStatic01');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic01 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic01 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic02
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic02 start');
      try{
        hilog.info(0x3200, tag, "%{public}s", 'testHilogTsApiStatic02');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic02 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic02 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic03
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic03 start');
      try{
        hilog.warn(0x3200, tag, "%{public}s", 'testHilogTsApiStatic03');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic03 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic03 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic04
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic04 start');
      try{
        hilog.error(0x3200, tag, "%{public}s", 'testHilogTsApiStatic04');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic04 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic04 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic05
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic05 start');
      try{
        hilog.fatal(0x3200, tag, "%{public}s", 'testHilogTsApiStatic05');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic05 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic05 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic06
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic06 start');
      try{
        hilog.info(0x3200, tag, "testHilogTsApiStatic06");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic06 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic06 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic07
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic07 start');
      try{
        hilog.info(0x3200, tag, "%{public}s", undefined);
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic07 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic07 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic08
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic08 start');
      try{
        let str: string = "a".repeat(4001) as string;
        hilog.info(0x3200, tag, "%{public}s", str);
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic08 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic08 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic09
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic09 start');
      try{
        hilog.info(0, tag, "%{public}s", "testHilogTsApiStatic09");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic09 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic09 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic10
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic10 start');
      try{
        hilog.info(0xffff, tag, "%{public}s", "testHilogTsApiStatic10");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic10 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic10 end');
    })


    /**
     * @tc.name   testHilogTsApiStatic11
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic11 start');
      try{
        hilog.info(0x3200, "中文测试", "%{public}s", "testHilogTsApiStatic11");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic11 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic11 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic12
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic12 start');
      try{
        hilog.info(0x3200, "1234", "%{public}s", "testHilogTsApiStatic12");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic12 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic12 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic13
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic13 start');
      try{
        let str: string = "a".repeat(33) as string;
        hilog.info(0x3200, tag + str, "%{public}s", "testHilogTsApiStatic13");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic13 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic13 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic14
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic14 start');
      const res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic14 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic15
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic15 start');
      const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic15 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic16
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic16 start');
      const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic16 end');
    })

        /**
         * @tc.name   testHilogTsApiStatic17
         * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1700
         * @tc.desc   hilog begin interface test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHilogTsApiStatic17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          hilog.info(domain, tag, 'testHilogTsApiStatic16 start');
          try{
            hilog.debug(0x0000, tag, "test hilog.debug() without parameter args");
            hilog.info(0x0000, tag, "test hilog.info() without parameter args");
            hilog.error(0x0000, tag, "test hilog.error() without parameter args");
            hilog.warn(0x0000, tag, "test hilog.warn() without parameter args");
            hilog.fatal(0x0000, tag, "test hilog.fatal() without parameter args");
          } catch (error){
            hilog.error(domain, tag, `testHilogTsApiStatic01 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
          }
          hilog.info(domain, tag, 'testHilogTsApiStatic16 end');
        })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0100
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.DEBUG);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0200
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.WARN);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0300
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0400
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.ERROR);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0500
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0600
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      try{
        for (let index = 0; index < 1000; index++) {
          hilog.info(0x3200, tag, "%{public}s", 'hilogJs0100')
          hilog.error(0x3200, tag, "%{public}s", 'hilogJs0100')
        }
      } catch (error){
        hilog.error(domain, tag, `SUB_DFX_DFT_DefaultLevel_Static_0600 got an error: ${JSON.stringify(error)}`)
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

  })
}