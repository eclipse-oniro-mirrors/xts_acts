'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function ImageColorFilterTest() {
  describe('ImageColorFilterTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageColorFilterTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageColorFilterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageColorFilter/ImageColorFilter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageColorFilterTest state pages:" + JSON.stringify(pages));
        if (!("ImageColorFilter" == pages.name)) {
          console.info("get ImageColorFilterTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ImageColorFilterTest page error:" + err);
      }
      console.info("ImageColorFilterTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("ImageColorFilterTest after each called");
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0100
     * @tc.name ImageColorFilterTest_static_0100
     * @tc.desc test colorFilter with ColorFilter matrix type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterMatrixColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0100] matrix is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getElement('$attrs').getString('colorFilter')).assertContain('1.000000');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0200
     * @tc.name ImageColorFilterTest_static_0200
     * @tc.desc test colorFilter with ColorFilter EnumColor
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterEnumColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0200] obj is: ' + strJson);
      console.info('[ImageColorFilterTest_static_0200] EnumColor is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getString('$type')).assertContain('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0300
     * @tc.name ImageColorFilterTest_static_0300
     * @tc.desc test colorFilter with ColorFilter Resource Number
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterNumColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0300] obj is: ' + strJson);
      console.info('[ImageColorFilterTest_static_0300] Resource Number is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getString('$type')).assertContain('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0400
     * @tc.name ImageColorFilterTest_static_0400
     * @tc.desc test colorFilter with ColorFilter Resource String
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterStringColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0400] obj is: ' + strJson);
      console.info('[ImageColorFilterTest_static_0400] Resource String is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getString('$type')).assertContain('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0500
     * @tc.name ImageColorFilterTest_static_0500
     * @tc.desc test colorFilter with ColorFilter DrawingColor
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterDrawingColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0500] obj is: ' + strJson);
      console.info('[ImageColorFilterTest_static_0500] DrawingColor is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getString('$type')).assertContain('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0600
     * @tc.name ImageColorFilterTest_static_0600
     * @tc.desc test colorFilter with ColorFilter ResourceColor
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageColorFilterTest_static_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('imageColorFilterResourceColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageColorFilterTest_static_0600] obj is: ' + strJson);
      console.info('[ImageColorFilterTest_static_0600] ResourceColor is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getString('$type')).assertContain('Image');
      done();
    });
  })
}