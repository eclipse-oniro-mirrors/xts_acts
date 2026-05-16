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

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';

const SLEEP_TIME = 1000;

export default function ImageColorFilterTest() {
  describe('ImageColorFilterTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageColorFilterTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageColorFilter/ImageColorFilterTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageColorFilterTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('ImageColorFilterTestPage' == pages.name)) {
          console.info('get ImageColorFilterTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push ImageColorFilterTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageColorFilterTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageColorFilterTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0100
     * @tc.name ImageColorFilterTest_0100
     * @tc.desc test colorFilter with ColorFilter matrix type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0100] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterMatrixId');
      console.info("[ImageColorFilterTest_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0100] matrix is: " + JSON.parse(strJson2).$attrs.colorFilter);

      expect(JSON.parse(strJson2).$attrs.colorFilter)
        .assertContain('1.000000');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0200
     * @tc.name ImageColorFilterTest_0200
     * @tc.desc test colorFilter with DrawingColorFilter type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0200] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterDrawingId');
      console.info("[ImageColorFilterTest_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0200] drawingColorFilter is: " + JSON.parse(strJson2).$attrs.colorFilter);

      let strJsonNew = getInspectorByKey('imageColorFilterDrawingId');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0300
     * @tc.name ImageColorFilterTest_0300
     * @tc.desc test colorFilter with ResourceColor number type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0300] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterColorNumberId');
      console.info("[ImageColorFilterTest_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0300] color number is: " + JSON.stringify(JSON.parse(strJson2).$attrs));
      console.info("[ImageColorFilterTest_0300] color number is: " + JSON.parse(strJson2).$attrs.colorFilter);

      let strJsonNew = getInspectorByKey('imageColorFilterColorNumberId');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0400
     * @tc.name ImageColorFilterTest_0400
     * @tc.desc test colorFilter with ResourceColor string type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0400] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterColorStringId');
      console.info("[ImageColorFilterTest_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0400] color string is: " + JSON.parse(strJson2).$attrs.colorFilter);

      let strJsonNew = getInspectorByKey('imageColorFilterColorStringId');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0500
     * @tc.name ImageColorFilterTest_0500
     * @tc.desc test colorFilter with ResourceColor Resource type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));

      let strJson2 = getInspectorByKey('imageColorFilterColorResourceId');
      console.info("[ImageColorFilterTest_0500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0500] color resource is: " + JSON.parse(strJson2).$attrs.colorFilter);

      let strJsonNew = getInspectorByKey('imageColorFilterColorResourceId');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Image');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0600
     * @tc.name ImageColorFilterTest_0600
     * @tc.desc test colorFilter with empty string
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0600] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterEmptyStringId');
      console.info("[ImageColorFilterTest_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0600] empty string is: " + JSON.parse(strJson2).$attrs.colorFilter);

      expect(JSON.parse(strJson2).$attrs.colorFilter).assertContain('1.000000');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0700
     * @tc.name ImageColorFilterTest_0700
     * @tc.desc test colorFilter with undefined
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0700] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterUndefinedId');
      console.info("[ImageColorFilterTest_0700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0700] undefined is: " + JSON.parse(strJson2).$attrs.colorFilter);

      expect(JSON.parse(strJson2).$attrs.colorFilter).assertContain('1.000000');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_COLORFILTER_PARAM_0800
     * @tc.name ImageColorFilterTest_0800
     * @tc.desc test colorFilter with null
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageColorFilterTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('ImageColorFilterTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageColorFilterDefaultId');
      console.info("[ImageColorFilterTest_0800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageColorFilterTest_0800] default is: " + JSON.parse(strJson1).$attrs.colorFilter);

      let strJson2 = getInspectorByKey('imageColorFilterNullId');
      console.info("[ImageColorFilterTest_0800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageColorFilterTest_0800] null is: " + JSON.parse(strJson2).$attrs.colorFilter);

      expect(JSON.parse(strJson2).$attrs.colorFilter).assertContain('1.000000');
      done();
    });
  })
}