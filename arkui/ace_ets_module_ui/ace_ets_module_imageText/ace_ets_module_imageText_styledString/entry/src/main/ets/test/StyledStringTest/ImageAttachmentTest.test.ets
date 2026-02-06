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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function ImageAttachmentTest() {
  describe('ImageAttachmentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageAttachment beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ImageAttachment',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageAttachment state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ImageAttachment" == pages.name)) {
          console.info("get ImageAttachment state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ImageAttachment page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageAttachment page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageAttachment after each called");
    });

    /**
     * @tc.name   ImageAttachment0001
     * @tc.number ImageAttachment0001
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage1'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0001 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment0001 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('10');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0001] end");
      done();
    });

    /**
     * @tc.name   ImageAttachment0002
     * @tc.number ImageAttachment0002
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage2'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0002 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0002 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('0');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0002] end");
      done();
    });

    /**
     * @tc.name   ImageAttachment0003
     * @tc.number ImageAttachment0003
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage3'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0003 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0003 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('0');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0003] end");
      done();
    });

    /**
     * @tc.name   ImageAttachment0004
     * @tc.number ImageAttachment0004
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage4'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0004 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment0004 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('10');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0004] end");
      done();
    });

    /**
     * @tc.name   ImageAttachment0005
     * @tc.number ImageAttachment0005
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0005', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage5'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0005 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment0005 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('0');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0005] end");
      done();
    });

    /**
     * @tc.name   ImageAttachment0006
     * @tc.number ImageAttachment0006
     * @tc.desc   The ImageAttachment Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAttachment0006', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment0006 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage6'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment0006 marginTop ' + AppStorage.get('marginTop'));
      expect('' + AppStorage.get('marginTop')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 marginRight ' + AppStorage.get('marginRight'));
      expect('' + AppStorage.get('marginRight')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 marginBottom ' + AppStorage.get('marginBottom'));
      expect('' + AppStorage.get('marginBottom')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 marginLeft ' + AppStorage.get('marginLeft'));
      expect('' + AppStorage.get('marginLeft')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 paddingTop ' + AppStorage.get('paddingTop'));
      expect('' + AppStorage.get('paddingTop')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 paddingRight ' + AppStorage.get('paddingRight'));
      expect('' + AppStorage.get('paddingRight')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 paddingBottom ' + AppStorage.get('paddingBottom'));
      expect('' + AppStorage.get('paddingBottom')).assertEqual('undefined');
      console.info('StyledString ImageAttachment0006 paddingLeft ' + AppStorage.get('paddingLeft'));
      expect('' + AppStorage.get('paddingLeft')).assertEqual('undefined');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment0006] end");
      done();
    });
  })
}