/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageTextTest() {
  describe('ImageTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info('image beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/ImageText',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageTextTest state pages:' + JSON.stringify(pages));
        if (!('ImageText' == pages.name)) {
          console.info('get ImageTextTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageTextTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageTextTest page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageTextTest after each called');
    });

    /**
     * @tc.name   ImageTextTest_0100
     * @tc.number ImageTextTest_0100
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageTextTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ImageTextTest_0100 START');
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('text');
      console.info('ImageTextTest_0100 component strJson:' + strJson);
      console.info('ImageTextTest_0100 JSON.parse(strJson).$attrs.content is: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('string_hello');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('9.00fp');
      console.info('ImageTextTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImageTextTest_0200
     * @tc.number ImageTextTest_0200
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageTextTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ImageTextTest_0200 START');
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('image');
      console.info('ImageTextTest_0200 component strJson:' + strJson);
      console.info('ImageTextTest_0200 JSON.parse(strJson).$attrs.src is: ' + JSON.parse(strJson).$attrs.src);
      expect(JSON.parse(strJson).$attrs.src).assertEqual('resource://rawfile/test.png');
      console.info('ImageTextTest_0200 END');
      done();
    });
  })
}