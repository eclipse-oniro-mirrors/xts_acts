'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function MarqueeTest() {
  describe('MarqueeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('MarqueeTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.common.api23.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('MarqueeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Marquee/Marquee',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('MarqueeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'Marquee') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('MarqueeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('MarqueeTest after each called');
    });

    /**
     * @tc.number MarqueeTest_001
     * @tc.name marqueeOptionsSpacing
     * @tc.desc marquee.d.ets marqueeOptionsSpacing
     */
    it('marqueeOptionsSpacing', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest execute: marqueeOptionsSpacing START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('marqueeCase');
        console.info('MarqueeTest marqueeCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let spacingVal = inspector.getInspectorByKey('marqueeSpacingValue');
        console.info('MarqueeTest marqueeSpacingValue: ' + spacingVal);
        expect(spacingVal.includes('=8')).assertEqual(true);
        let stateSnapshot = AppStorage.get<string>('MarqueePageState') ?? '';
        console.info('MarqueeTest MarqueePageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('spacingValue=8')).assertEqual(true);

        console.info('MarqueeTest execute: marqueeOptionsSpacing END');
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeOptionsSpacing error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_002
     * @tc.name marqueeOptionsDelay
     * @tc.desc marquee.d.ets marqueeOptionsDelay
     */
    it('marqueeOptionsDelay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest execute: marqueeOptionsDelay START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('marqueeCase');
        console.info('MarqueeTest marqueeCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let delayVal = inspector.getInspectorByKey('marqueeDelayValue');
        console.info('MarqueeTest marqueeDelayValue: ' + delayVal);
        expect(delayVal.includes('=1000')).assertEqual(true);
        let stateSnapshot = AppStorage.get<string>('MarqueePageState') ?? '';
        console.info('MarqueeTest MarqueePageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('delayValue=1000')).assertEqual(true);

        console.info('MarqueeTest execute: marqueeOptionsDelay END');
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeOptionsDelay error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_003
     * @tc.name marqueeAttributeFontWeight
     * @tc.desc marquee.d.ets marqueeAttributeFontWeight
     */
    it('marqueeAttributeFontWeight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest execute: marqueeAttributeFontWeight START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('marqueeCase');
        console.info('MarqueeTest marqueeCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let fontWeightVal = inspector.getInspectorByKey('marqueeFontWeightValue');
        console.info('MarqueeTest marqueeFontWeightValue: ' + fontWeightVal);
        expect(fontWeightVal.includes('=400')).assertEqual(true);
        let stateSnapshot = AppStorage.get<string>('MarqueePageState') ?? '';
        console.info('MarqueeTest MarqueePageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('fontWeightValue=400')).assertEqual(true);

        console.info('MarqueeTest execute: marqueeAttributeFontWeight END');
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeAttributeFontWeight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_004
     * @tc.name marqueeFontWeightBold
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Bold variant     */
    it('marqueeFontWeightBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwBold');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('fontWeight');
        console.info('MarqueeTest mFwBold fontWeight value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_005
     * @tc.name marqueeFontWeightNormal
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Normal variant     */
    it('marqueeFontWeightNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightNormal START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwNormal');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('fontWeight');
        console.info('MarqueeTest mFwNormal fontWeight value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_006
     * @tc.name marqueeFontWeightLighter
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Lighter variant     */
    it('marqueeFontWeightLighter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightLighter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwLighter');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightLighter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_007
     * @tc.name marqueeFontWeightRegular
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Regular variant     */
    it('marqueeFontWeightRegular', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightRegular START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwRegular');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightRegular error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_008
     * @tc.name marqueeFontWeightMedium
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Medium variant     */
    it('marqueeFontWeightMedium', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightMedium START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwMedium');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightMedium error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_009
     * @tc.name marqueeFontWeightBolder
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - FontWeight.Bolder variant     */
    it('marqueeFontWeightBolder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightBolder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwBolder');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightBolder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_010
     * @tc.name marqueeFontWeightResourceStr
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - ResourceStr variant: '900'     */
    it('marqueeFontWeightResourceStr', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightResourceStr START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwStr');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('fontWeight');
        console.info('MarqueeTest mFwStr fontWeight value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightResourceStr error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number MarqueeTest_011
     * @tc.name marqueeFontWeightUndefined
     * @tc.desc marquee.d.ets MarqueeAttribute.fontWeight - undefined variant     */
    it('marqueeFontWeightUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MarqueeTest: marqueeFontWeightUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('mFwUndef');
        expect(strJson.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('MarqueeTest marqueeFontWeightUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
