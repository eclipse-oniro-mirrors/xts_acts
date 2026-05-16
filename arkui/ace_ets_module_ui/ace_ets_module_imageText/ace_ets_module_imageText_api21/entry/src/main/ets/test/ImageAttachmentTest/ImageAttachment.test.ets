/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageAttachmentTest() {
  describe('ImageAttachmentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAttachmentTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/ImageAttachment',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get ImageAttachmentTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('ImageAttachmentTest')) {

          const result = await router.replaceUrl(options);
          console.info('push ImageAttachmentTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push ImageAttachmentTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAttachmentTest afterEach called');

    });

    /**
     * @tc.name   ImageAttachmentTest001
     * @tc.number ImageAttachmentTest001
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(50vp)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('button50vp'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest001] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('sizeInVp width:50.00height:50.00');
      console.info('[ImageAttachmentTest001] END');
      done();
    });

    /**
     * @tc.name   ImageAttachmentTest002
     * @tc.number ImageAttachmentTest002
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(50px)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest002] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button2 = await driver.findComponent(ON.id('button50px'));
      await CommonFunc.sleep(500);
      await button2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest002] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('sizeInVp width:33.33height:33.33');
      console.info('[ImageAttachmentTest002] END');
      done();
    });

    /**
     * @tc.name   ImageAttachmentTest003
     * @tc.number ImageAttachmentTest003
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest003] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button3 = await driver.findComponent(ON.id('button0'));
      await CommonFunc.sleep(500);
      await button3.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest003] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('sizeInVp width:0.00height:0.00');
      console.info('[ImageAttachmentTest003] END');
      done();
    });

    /**
     * @tc.name   ImageAttachmentTest004
     * @tc.number ImageAttachmentTest004
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(-50)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest004] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button4 = await driver.findComponent(ON.id('button50'));
      await CommonFunc.sleep(500);
      await button4.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest004] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('px size width:0.00height:0.00');
      console.info('[ImageAttachmentTest004] END');
      done();
    });

    /**
     * @tc.name   ImageAttachmentTest005
     * @tc.number ImageAttachmentTest005
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest005', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest005] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1500);
      let button5 = await driver.findComponent(ON.id('buttonUndefined'));
      await CommonFunc.sleep(500);
      await button5.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest005] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('px size width:0.00height:0.00');
      console.info('[ImageAttachmentTest005] END');
      done();
    });

    /**
     * @tc.name   ImageAttachmentTest006
     * @tc.number ImageAttachmentTest006
     * @tc.desc   test the attr of StyledString: ImageAttachment.sizeInVp(null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachmentTest006', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAttachmentTest006] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button6 = await driver.findComponent(ON.id('buttonNull'));
      await CommonFunc.sleep(500);
      await button6.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAttachmentTest006] obj.$attrs.content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('px size width:0.00height:0.00');
      console.info('[ImageAttachmentTest006] END');
      done();
    });

  })
}