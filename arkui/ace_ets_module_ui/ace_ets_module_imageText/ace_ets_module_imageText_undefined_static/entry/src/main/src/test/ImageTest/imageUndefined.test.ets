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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function ImageUndefinedTest() {
  describe('ImageUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ImageUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/imageUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ImageUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('imageUndefined' == pages.name)) {
          console.info('get ImageUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ImageUndefinedTest page error:' + err);
      }
      console.info('ImageUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0100
     * @tc.name      ImageUndefinedTest_static_0100
     * @tc.desc      ImageUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let fitOriginalSize_action = await driver.findComponent(ON.id('fitOriginalSize_action')) as Component;
      await fitOriginalSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let fitOriginalSizeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fitOriginalSize');
      expect(fitOriginalSizeValue.asString()).assertEqual('true');

      await fitOriginalSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('image_action');
      let fitOriginalSizeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fitOriginalSize');
      expect(fitOriginalSizeValue1.asString()).assertEqual('false');
      await fitOriginalSize_action.click();

      console.info('[ImageUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0101
     * @tc.name      ImageUndefinedTest_static_0101
     * @tc.desc      ImageUndefinedTest_static_0101
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0101] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let colorFilter_action = await driver.findComponent(ON.id('colorFilter_action')) as Component;
      await colorFilter_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let colorFilterValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('colorFilter');
      expect(colorFilterValue.asString()).assertEqual('' +
        '1.000000 0.000000 1.000000 0.000000 1.000000 ' +
        '0.000000 0.000000 0.000000 1.000000 0.000000 ' +
        '1.000000 0.000000 1.000000 0.000000 0.000000 ' +
        '0.000000 1.000000 0.000000 1.000000 0.000000 ');

      await colorFilter_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('image_action');
      let colorFilterValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('colorFilter');
      expect(colorFilterValue1.asString()).assertEqual('' +
        '1.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '0.000000 1.000000 0.000000 0.000000 0.000000 ' +
        '0.000000 0.000000 1.000000 0.000000 0.000000 ' +
        '0.000000 0.000000 0.000000 1.000000 0.000000 ');

      console.info('[ImageUndefinedTest_static_0101] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0102
     * @tc.name      ImageUndefinedTest_static_0102
     * @tc.desc      ImageUndefinedTest_static_0102
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0102] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let sourceSize_action = await driver.findComponent(ON.id('sourceSize_action')) as Component;
      await sourceSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let sourceSizeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sourceSize');

      await sourceSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('image_action');
      let sourceSizeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('sourceSize');
      expect(sourceSizeValue1.asString()).assertEqual('[0.00 x 0.00]');

      console.info('[ImageUndefinedTest_static_0102] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0103
     * @tc.name      ImageUndefinedTest_static_0103
     * @tc.desc      ImageUndefinedTest_static_0103
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0103] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let imageMatrix_action = await driver.findComponent(ON.id('imageMatrix_action')) as Component;
      await imageMatrix_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let imageMatrixValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('imageMatrix');
      expect(imageMatrixValue.asString()).assertEqual('' +
        '1.000000,0.000000,0.000000,0.000000,\n' +
        '0.000000,1.000000,0.000000,0.000000,\n' +
        '0.000000,0.000000,1.000000,0.000000,\n' +
        '-100.000000,-100.000000,0.000000,1.000000,\n');

      await imageMatrix_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('image_action');
      let imageMatrixValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('imageMatrix');
      expect(imageMatrixValue1.asString()).assertEqual('' +
        '1.000000,0.000000,0.000000,0.000000,\n' +
        '0.000000,1.000000,0.000000,0.000000,\n' +
        '0.000000,0.000000,1.000000,0.000000,\n' +
        '0.000000,0.000000,0.000000,1.000000,\n');

      console.info('[ImageUndefinedTest_static_0103] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0104
     * @tc.name      ImageUndefinedTest_static_0104
     * @tc.desc      ImageUndefinedTest_static_0104
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0104', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0104] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let altValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alt');
      expect(altValue.asString()).assertEqual('')

      console.info('[ImageUndefinedTest_static_0104] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0105
     * @tc.name      ImageUndefinedTest_static_0105
     * @tc.desc      ImageUndefinedTest_static_0105
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0105', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0105] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let matchTextDirection_action = await driver.findComponent(ON.id('matchTextDirection_action')) as Component;
      await matchTextDirection_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('image_action');
      let matchTextDirectionValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('matchTextDirection');
      expect(matchTextDirectionValue.asString()).assertEqual('true');

      await matchTextDirection_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('image_action');
      let matchTextDirectionValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('matchTextDirection');
      expect(matchTextDirectionValue1.asString()).assertEqual('false');

      console.info('[ImageUndefinedTest_static_0105] END');
      done();
    });

    /**
     * @tc.number    ImageUndefinedTest_static_0106
     * @tc.name      ImageUndefinedTest_static_0106
     * @tc.desc      ImageUndefinedTest_static_0106
     * @tc.level     Level.LEVEL1
     */
    it('ImageUndefinedTest_static_0106', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageUndefinedTest_static_0106] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let onComplete_action = await driver.findComponent(ON.id('onComplete_action')) as Component;
      await onComplete_action.click();
      await CommonFunc.sleep(1000);

      let driver1 = Driver.create();
      let sourceSize_action = await driver1.findComponent(ON.id('sourceSize_action')) as Component;
      await sourceSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('onCompleteValue');
      let onCompleteValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onCompleteValue.asString()).assertEqual('UU');

      await onComplete_action.click();
      await CommonFunc.sleep(1000);
      await sourceSize_action.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('onCompleteValue');
      let onCompleteValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onCompleteValue1.asString()).assertEqual('UU');

      console.info('[ImageUndefinedTest_static_0106] END');
      done();
    });

  })
}