/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '@ohos/hypium';
import router from '@system.router';
import { BY, UiDriver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

interface optionsObj {
  uri: string
}

export default function ListCrownTest() {
  describe('ListCrownTest', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/List/listCrown',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List state pages: " + JSON.stringify(pages));
        if (!("listCrown" == pages.name)) {
          console.info("get List state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push List page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0100
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0100
     * @tc.desc   The OnDigitalCrown method for testing the listitem component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0100',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the ListItem component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0100] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let listDigitalCrown = await driver.findComponent(BY.key('listitem01'));
      let text = await listDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0100] listDigitalCrown: " + text);
      expect(text).assertEqual('OpenharmonyTest1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0100] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0200
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0200
     * @tc.desc   The OnDigitalCrown method for testing the listitem component with undefine scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0200',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the ListItem component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0200] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let textDigitalCrown = await driver.findComponent(BY.key('listitem02'));
      let text = await textDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0200] textDigitalCrown: " + text);
      expect(text).assertEqual('OpenharmonyTest2');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0200] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0300
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0300
     * @tc.desc   The OnDigitalCrown method for testing the button component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0300',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the button component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0300] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let listItemDigitalCrown = await driver.findComponent(BY.key('button1'));
      let text = await listItemDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0300] listItemDigitalCrown: " + text);
      expect(text).assertEqual('testCrownBTN1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0300] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0400
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0400
     * @tc.desc   The OnDigitalCrown method for testing the button component with undefine scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0400',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the button component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0400] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let listDigitalCrown = await driver.findComponent(BY.key('button2'));
      let text = await listDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0400] listDigitalCrown: " + text);
      expect(text).assertEqual('testCrownBTN2');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0400] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0500
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0500
     * @tc.desc   The OnDigitalCrown method for testing the text component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0500',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the text component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0500] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let listItemDigitalCrown = await driver.findComponent(BY.key('text01'));
      let text = await listItemDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0500] listItemDigitalCrown: " + text);
      expect(text).assertEqual('testCrowntext1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0500] END');
      done();
    });

    /**
     * @tc.name   ArkUI_Stage_List_OnDigitalCrown_0600
     * @tc.number ArkUI_Stage_List_OnDigitalCrown_0600
     * @tc.desc   The OnDigitalCrown method for testing the text component with undefine scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Stage_List_OnDigitalCrown_0600',  Level.LEVEL1, async (done: Function) => {
      // Verify the functions of the text component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_0600] START');
      // Verify the functions of onDigitalCrown
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let listDigitalCrown = await driver.findComponent(BY.key('text02'));
      let text = await listDigitalCrown.getText();
      console.info("[ArkUI_Stage_List_OnDigitalCrown_0600] listDigitalCrown: " + text);
      expect(text).assertEqual('testCrowntext2');

      console.info('[ArkUI_Stage_List_OnDigitalCrown_0600] END');
      done();
    });
  })
}
