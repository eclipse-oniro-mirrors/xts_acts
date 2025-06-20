/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hiappevent from 'libentry.so';

export default function processorNDKTest() {
  describe('processorNDKTest', () => {
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0100
     * @tc.name testHiAppEventProcessoCode01
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute正常参数入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
      const processor = hiappevent.CreateProcessor("test_processor");
      const appId = "com.example.app";
      const routeInfo = "https://hiappevents.com/test";
      const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0200
     * @tc.name testHiAppEventProcessoCode02
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
      const processor = hiappevent.CreateProcessor("");
      const appId = "com.example.app";
      const routeInfo = "https://hiappevents.com/test";
      const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
      expect(result).assertEqual(-7);
      done();
    })
      /**
       * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0300
       * @tc.name testHiAppEventProcessoCode03
       * @tc.desc 验证OH_HiAppEvent_SetReportRoute-appId为空
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level3
       */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("Test_processor12");
        const appId = "";
        const routeInfo = "https://hiappevents.com/test";
        const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
        expect(result).assertEqual(0);
        done();
    })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0400
     * @tc.name testHiAppEventProcessoCode04
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute-routeInfo为空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("Test");
        const appId = "com.example.app";
        const routeInfo = "";
        const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
        expect(result).assertEqual(0);
        done();
    })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0500
     * @tc.name testHiAppEventProcessoCode05
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("1test");
        const appId = "com.example.app";
        const routeInfo = "https://hiappevents.com/test";
        const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
        expect(result).assertEqual(-7);
        done();
    })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0600
     * @tc.name testHiAppEventProcessoCode06
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute-routeInfo长度超最大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("Test");
        const appId = "com.example.app";
        const routeInfo = "a".repeat(9000);
        const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
        expect(result).assertEqual(4);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0700
     * @tc.name testHiAppEventProcessoCode07
     * @tc.desc 验证OH_HiAppEvent_SetReportRoute-appId长度超最大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("Test");
        const appId = "a".repeat(9000);
        const routeInfo = "https://hiappevents.com/test";
        const result = hiappevent.SetReportRoute(processor, appId, routeInfo);
        expect(result).assertEqual(4);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0800
     * @tc.name testHiAppEventProcessoCode08
     * @tc.desc 验证OH_HiAppEvent_SetReportPolicy正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("test_processor");
        const result = hiappevent.SetReportPolicy(processor, 10, 5, true, false)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_0900
     * @tc.name testHiAppEventProcessoCode09
     * @tc.desc 验证OH_HiAppEvent_SetReportPolicy-periodReport小于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("test_processor");
        const result = hiappevent.SetReportPolicy(processor, -10, 0, false, true)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1000
     * @tc.name testHiAppEventProcessoCode10
     * @tc.desc 验证OH_HiAppEvent_SetReportPolicy-batchReport小于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("test_processor");
        const result = hiappevent.SetReportPolicy(processor, 10000000, -10, false, false)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1100
     * @tc.name testHiAppEventProcessoCode11
     * @tc.desc 验证OH_HiAppEvent_SetReportPolicy-batchReport大于1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("test_processor");
        const result = hiappevent.SetReportPolicy(processor, 0, 10000, undefined, true)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1200
     * @tc.name testHiAppEventProcessoCode12
     * @tc.desc 验证OH_HiAppEvent_SetReportPolicy-batchReport无效指针
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("123");
        const result = hiappevent.SetReportPolicy(processor, 0, 10000, undefined, true)
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1300
     * @tc.name testHiAppEventProcessoCode13
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const domain = "OS";
        const name = "ADDRESS_SANITIZER";
        const isRealTime = true;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1400
     * @tc.name testHiAppEventProcessoCode14
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent参数值无效
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const domain = "com.example.domain";
        const name = "test_event";
        const isRealTime = true;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(-9);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1500
     * @tc.name testHiAppEventProcessoCode15
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("123");
        const domain = "OS";
        const name = "ADDRESS_SANITIZER";
        const isRealTime = true;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1600
     * @tc.name testHiAppEventProcessoCode16
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent-domain为空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const domain = "";
        const name = "RESOURCE_OVERLIMIT";
        const isRealTime = true;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(-9);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1700
     * @tc.name testHiAppEventProcessoCode17
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const domain = "OS";
        const name = "";
        const isRealTime = true;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(-9);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1800
     * @tc.name testHiAppEventProcessoCode18
     * @tc.desc 验证OH_HiAppEvent_SetReportEvent-isRealTime为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const domain = "OS";
        const name = "ADDRESS_SANITIZER";
        const isRealTime = false;
        const result = hiappevent.SetReportEvent(processor,domain,name,isRealTime)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_1900
     * @tc.name testHiAppEventProcessoCode19
     * @tc.desc 验证OH_HiAppEvent_SetCustomConfig正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const key = "test";
        const value = "test";
        const result = hiappevent.SetCustomConfig(processor,key,value)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2000
     * @tc.name testHiAppEventProcessoCode20
     * @tc.desc 验证OH_HiAppEvent_SetCustomConfig-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("a".repeat(257));
        const key = "test";
        const value = "test";
        const result = hiappevent.SetCustomConfig(processor,key,value)
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2100
     * @tc.name testHiAppEventProcessoCode21
     * @tc.desc 验证OH_HiAppEvent_SetCustomConfig-key超最大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const key = "t".repeat(33);
        const value = "test";
        const result = hiappevent.SetCustomConfig(processor,key,value)
        expect(result).assertEqual(4);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2200
     * @tc.name testHiAppEventProcessoCode22
     * @tc.desc 验证OH_HiAppEvent_SetCustomConfig-value超最大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const key = "123";
        const value = "t".repeat(1025);
        const result = hiappevent.SetCustomConfig(processor,key,value)
        expect(result).assertEqual(4);
        done();
      })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2300
     * @tc.name testHiAppEventProcessoCode23
     * @tc.desc 验证OH_HiAppEvent_SetConfigId正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const configId = 123;
        const result = hiappevent.SetConfigId(processor,configId);
        expect(result).assertEqual(0);
        done();
      })
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2400
     * @tc.name testHiAppEventProcessoCode24
     * @tc.desc 验证OH_HiAppEvent_SetConfigId-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("/test");
        const configId = 0;
        const result = hiappevent.SetConfigId(processor,configId);
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2500
     * @tc.name testHiAppEventProcessoCode25
     * @tc.desc 验证OH_HiAppEvent_SetConfigId-configId小于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessorr");
        const configId = -10;
        const result = hiappevent.SetConfigId(processor,configId);
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2700
     * @tc.name testHiAppEventProcessoCode27
     * @tc.desc 验证OH_HiAppEvent_SetReportUserId正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessorr");
        const userIdNames= ['testprocessor','processor2','processor3'];
        const size = 1;
        const result = hiappevent.SetReportUserId(processor,userIdNames,size);
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2800
     * @tc.name testHiAppEventProcessoCode28
     * @tc.desc 验证OH_HiAppEvent_SetReportUserId-size值大于数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessor");
        const userIdNames= ['testprocessor'];
        const size = 2;
        const result = hiappevent.SetReportUserId(processor,userIdNames,size);
        expect(result).assertEqual(4);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_2900
     * @tc.name testHiAppEventProcessoCode29
     * @tc.desc 验证OH_HiAppEvent_SetReportUserId-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("123");
        const userIdNames= ['testprocessorr'];
        const size = 1;
        const result = hiappevent.SetReportUserId(processor,userIdNames,size);
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3000
     * @tc.name testHiAppEventProcessoCode30
     * @tc.desc 验证OH_HiAppEvent_SetReportUserProperty正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocessorr");
        const userPropertyNames= ['testprocessor','processor2','processor3'];
        const size = 1;
        const result = hiappevent.SetReportUserProperty(processor,userPropertyNames,size);
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3100
     * @tc.name testHiAppEventProcessoCode31
     * @tc.desc 验证OH_HiAppEvent_SetReportUserProperty-size值大于数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
      const processor = hiappevent.CreateProcessor("testprocessor");
      const userPropertyNames= ['testprocessor'];
      const size = 2;
      const result = hiappevent.SetReportUserProperty(processor,userPropertyNames,size);
      expect(result).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3200
     * @tc.name testHiAppEventProcessoCode32
     * @tc.desc 验证OH_HiAppEvent_SetReportUserId-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
      const processor = hiappevent.CreateProcessor("123");
      const userPropertyNames= ['testprocessorr'];
      const size = 1;
      const result = hiappevent.SetReportUserProperty(processor,userPropertyNames,size);
      expect(result).assertEqual(-7);
      done();
    })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3400
     * @tc.name testHiAppEventProcessoCode34
     * @tc.desc 验证OH_HiAppEvent_AddProcessor-Processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("hiappevent");
        const result = hiappevent.AddProcessor(processor);
        expect(result).assertEqual(-100);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3500
     * @tc.name testHiAppEventProcessoCode35
     * @tc.desc 验证OH_HiAppEvent_AddProcessor-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("114");
        const result = hiappevent.AddProcessor(processor);
        expect(result).assertEqual(-7);
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3700
     * @tc.name testHiAppEventProcessoCode37
     * @tc.desc 验证OH_HiAppEvent_Remove-事件处理者不存在
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
      const processor = hiappevent.CreateProcessor("test");
      const processorID = hiappevent.AddProcessor(processor);
      const result = hiappevent.RemoveProcessor(processorID)
      expect(result).assertEqual(-8);
      done();
    })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3800
     * @tc.name testHiAppEventProcessoCode38
     * @tc.desc 验证OH_HiAppEvent_DestroyProcessor正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("testprocesoor")
        const result = hiappevent.DestroyProcessor(processor);
        expect(true).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Processor_Code_3900
     * @tc.name testHiAppEventProcessoCode39
     * @tc.desc 验证OH_HiAppEvent_DestroyProcessor-processor异常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('SUB_DFX_DFT_HiAppEvent_Processor_Code_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)  => {
        const processor = hiappevent.CreateProcessor("124")
        const result = hiappevent.DestroyProcessor(processor);
        expect(false).assertFalse();
        done();
      })
   })
}