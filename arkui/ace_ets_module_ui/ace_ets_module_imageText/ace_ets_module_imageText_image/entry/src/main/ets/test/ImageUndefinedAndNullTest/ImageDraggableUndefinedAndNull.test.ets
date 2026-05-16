/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageDraggableUndefinedAndNullTest() {
  describe('ImageDraggableUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageDraggableUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageDraggableUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageDraggableUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageDraggableUndefinedAndNull' == pages.name)) {
          console.info('get ImageDraggableUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageDraggableUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageDraggableUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageDraggableUndefinedAndNullTest_0100
     * @tc.number ImageDraggableUndefinedAndNullTest_0100
     * @tc.desc   test the ImageDraggable undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageDraggableUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageDraggableUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageDraggableUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageDraggableUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageDraggableUndefinedAndNullTest_0100] ImageDraggableUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.draggable));
      expect(obj.$attrs.draggable).assertEqual('true');
      console.info('[ImageDraggableUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageDraggableUndefinedAndNullTest_0200
     * @tc.number ImageDraggableUndefinedAndNullTest_0200
     * @tc.desc   test the ImageDraggable null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageDraggableUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageDraggableUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageDraggableNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageDraggableUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageDraggableUndefinedAndNullTest_0200] ImageDraggableUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.draggable));
      expect(obj.$attrs.draggable).assertEqual('true');
      console.info('[ImageDraggableUndefinedAndNullTest_0200] END');
      done();
    });
  })
}