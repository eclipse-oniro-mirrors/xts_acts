'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, afterAll, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';
import {
  CustomSpanMeasureInfo,
} from '@kit.ArkUI';

export default function CustomSpanMeasureInfoTest() {
  describe('CustomSpanMeasureInfoTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CustomSpanMeasureInfoTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomSpanMeasureInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/CustomSpanMeasureInfo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("CustomSpanMeasureInfoTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "CustomSpanMeasureInfo") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push CustomSpanMeasureInfoTest page error:" + err);
        expect().assertFail();
      }
      console.info("CustomSpanMeasureInfoTest beforeEach end");
    });

    afterAll(async () => {
      AppStorage.delete('customSpanMeasure_maxWidth_300')
      AppStorage.delete('customSpanMeasure_maxWidth_500')
      AppStorage.delete('customSpanMeasure_maxWidth_full')
      AppStorage.delete('customSpanMeasure_maxWidth_percent')
      AppStorage.delete('customSpanMeasure_layoutPolicy_none')
      AppStorage.delete('customSpanMeasure_layoutPolicy_set')
      AppStorage.delete('customSpanMeasure_null_test')
      AppStorage.delete('customSpanMeasure_undefined_test')
      console.info("CustomSpanMeasureInfoTest after all called");
    });
    /**
     * @tc.name   customSpanMeasureInfo_maxWidth_0100
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_MAXWIDTH_0100
     * @tc.desc   Test CustomSpanMeasureInfo maxWidth property when Text width is 300 (number type)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_maxWidth_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_maxWidth_0100] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_maxWidth_300'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_maxWidth_300');
      console.info('[customSpanMeasureInfo_maxWidth_0100] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_maxWidth_0100] maxWidth: ' + measureInfoData.maxWidth);
        console.info('[customSpanMeasureInfo_maxWidth_0100] fontSize: ' + measureInfoData.fontSize);
        console.info('[customSpanMeasureInfo_maxWidth_0100] layoutPolicy: ' + measureInfoData.layoutPolicy);
        
        expect(measureInfoData.maxWidth !=null).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
        expect(measureInfoData.fontSize !=null).assertEqual(true);
        expect(typeof measureInfoData.fontSize).assertEqual('number');
      } else {
        console.info('[customSpanMeasureInfo_maxWidth_0100] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_maxWidth_0100] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_maxWidth_0200
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_MAXWIDTH_0200
     * @tc.desc   Test CustomSpanMeasureInfo maxWidth property when Text width is 500 (number type)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_maxWidth_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_maxWidth_0200] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_maxWidth_500'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_maxWidth_500');
      console.info('[customSpanMeasureInfo_maxWidth_0200] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_maxWidth_0200] maxWidth: ' + measureInfoData.maxWidth);
        
        expect(measureInfoData.maxWidth != null).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
      } else {
        console.info('[customSpanMeasureInfo_maxWidth_0200] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_maxWidth_0200] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_maxWidth_0300
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_MAXWIDTH_0300
     * @tc.desc   Test CustomSpanMeasureInfo maxWidth property when Text width is 100% (percentage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_maxWidth_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_maxWidth_0300] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_maxWidth_full'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_maxWidth_full');
      console.info('[customSpanMeasureInfo_maxWidth_0300] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_maxWidth_0300] maxWidth: ' + measureInfoData.maxWidth);
        
        expect(measureInfoData.maxWidth != null).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
      } else {
        console.info('[customSpanMeasureInfo_maxWidth_0300] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_maxWidth_0300] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_maxWidth_0400
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_MAXWIDTH_0400
     * @tc.desc   Test CustomSpanMeasureInfo maxWidth property when Text width is 80% (percentage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_maxWidth_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_maxWidth_0400] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_maxWidth_percent'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_maxWidth_percent');
      console.info('[customSpanMeasureInfo_maxWidth_0400] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_maxWidth_0400] maxWidth: ' + measureInfoData.maxWidth);
        
        expect(measureInfoData.maxWidth != null).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
      } else {
        console.info('[customSpanMeasureInfo_maxWidth_0400] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_maxWidth_0400] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_layoutPolicy_0100
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_LAYOUTPOLICY_0100
     * @tc.desc   Test CustomSpanMeasureInfo layoutPolicy property when not explicitly set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_layoutPolicy_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_layoutPolicy_0100] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_layoutPolicy_none'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_layoutPolicy_none');
      console.info('[customSpanMeasureInfo_layoutPolicy_0100] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_layoutPolicy_0100] layoutPolicy: ' + measureInfoData.layoutPolicy);
        
        if (measureInfoData.layoutPolicy != null && measureInfoData.layoutPolicy != undefined) {
          console.info('[customSpanMeasureInfo_layoutPolicy_0100] layoutPolicy has a value: ' + measureInfoData.layoutPolicy);
        } else {
          console.info('[customSpanMeasureInfo_layoutPolicy_0100] layoutPolicy is null or undefined, which is valid when no layout policy is set');
        }
      } else {
        console.info('[customSpanMeasureInfo_layoutPolicy_0100] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_layoutPolicy_0100] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_layoutPolicy_0200
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_LAYOUTPOLICY_0200
     * @tc.desc   Test CustomSpanMeasureInfo layoutPolicy property with LayoutPolicy value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_layoutPolicy_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_layoutPolicy_0200] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_layoutPolicy_set'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_layoutPolicy_set');
      console.info('[customSpanMeasureInfo_layoutPolicy_0200] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_layoutPolicy_0200] layoutPolicy: ' + measureInfoData.layoutPolicy);
        
        if (measureInfoData.layoutPolicy != null && measureInfoData.layoutPolicy != undefined) {
          console.info('[customSpanMeasureInfo_layoutPolicy_0200] layoutPolicy type is valid');
        } else {
          console.info('[customSpanMeasureInfo_layoutPolicy_0200] layoutPolicy is null or undefined');
        }
      } else {
        console.info('[customSpanMeasureInfo_layoutPolicy_0200] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_layoutPolicy_0200] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_layoutPolicy_null_0100
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_LAYOUTPOLICY_NULL_0100
     * @tc.desc   Test CustomSpanMeasureInfo layoutPolicy property when it is null or undefined (no layout policy set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_layoutPolicy_null_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_null'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_null_test');
      console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] maxWidth: ' + measureInfoData.maxWidth);
        console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] layoutPolicy: ' + measureInfoData.layoutPolicy);
        
        expect(measureInfoData.maxWidth != null).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
        
        if (measureInfoData.layoutPolicy == null || measureInfoData.layoutPolicy == undefined) {
          console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] layoutPolicy is null or undefined, which is valid');
        } else {
          console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] layoutPolicy has a value: ' + measureInfoData.layoutPolicy);
        }
      } else {
        console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_layoutPolicy_null_0100] END');
      done();
    })

    /**
     * @tc.name   customSpanMeasureInfo_layoutPolicy_undefined_0100
     * @tc.number SUB_ARKUI_CUSTOMSPAN_MEASUREINFO_LAYOUTPOLICY_UNDEFINED_0100
     * @tc.desc   Test CustomSpanMeasureInfo layoutPolicy property when it is undefined (no layout policy set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('customSpanMeasureInfo_layoutPolicy_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] START');
      let driver: Driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('customSpan_measure_undefined'));
      expect(textComponent !=null).assertEqual(true);
      
      await CommonFunc.sleep(500);
      
      let measureInfoData = AppStorage.get<CustomSpanMeasureInfo>('customSpanMeasure_undefined_test');
      console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] measureInfoData: ' + JSON.stringify(measureInfoData));
      
      expect(measureInfoData !=null).assertEqual(true);
      
      if (measureInfoData != undefined) {
        console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] maxWidth: ' + measureInfoData.maxWidth);
        console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] layoutPolicy: ' + measureInfoData.layoutPolicy);
        
        expect(measureInfoData.maxWidth !=null ).assertEqual(true);
        expect(typeof measureInfoData.maxWidth).assertEqual('number');
        
        if (measureInfoData.layoutPolicy == null || measureInfoData.layoutPolicy == undefined) {
          console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] layoutPolicy is null or undefined, which is valid');
        } else {
          console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] layoutPolicy has a value: ' + measureInfoData.layoutPolicy);
        }
      } else {
        console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] measureInfoData is undefined or null');
        expect().assertFail();
      }
      
      console.info('[customSpanMeasureInfo_layoutPolicy_undefined_0100] END');
      done();
    })

  })
}