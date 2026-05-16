'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { ON, Driver } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from '../Util.test'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ListTest() {
  describe('ListTest', () => {
    beforeAll(() => {
      console.info("ListTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get List state pages: " + JSON.stringify(pages));
        if (!("List" == pages.name)) {
          console.info("get List state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(async () => {
      console.info("afterAll case");
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0100
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0100
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the ListItem component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0100] START');
      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let listDigitalCrown = await driver.findComponent(ON.id('listitem01'));
      let text = await (listDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0100] listDigitalCrown: " + text);
      expect(text).assertEqual('OpenharmonyTest1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0100] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0200
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0200
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the ListItem component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0200] START');
      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let textDigitalCrown = await driver.findComponent(ON.id('listitem02'));
      let text = await (textDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0200] textDigitalCrown: " + text);
      expect(text).assertEqual('OpenharmonyTest2');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0200] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0300
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0300
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the button component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0300] START');
      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let listItemDigitalCrown = await driver.findComponent(ON.id('button1'));
      let text = await (listItemDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0300] listItemDigitalCrown: " + text);
      expect(text).assertEqual('testCrownBTN1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0300] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0400
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0400
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the button component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0400] START');
      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let listDigitalCrown = await driver.findComponent(ON.id('button2'));
      let text = await (listDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0400] listDigitalCrown: " + text);
      expect(text).assertEqual('testCrownBTN2');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0400] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0500
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0500
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the text component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0500] START');
      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let listItemDigitalCrown = await driver.findComponent(ON.id('text01'));
      let text = await (listItemDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0500] listItemDigitalCrown: " + text);
      expect(text).assertEqual('testCrowntext1');
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0500] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_List_OnDigitalCrown_Static_0600
     * @tc.name     ArkUI_Stage_List_OnDigitalCrown_Static_0600
     * @tc.desc     ArkUI_Stage_List_OnDigitalCrown_Static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_List_OnDigitalCrown_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of the text component
      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0600] START');

      // Verify the functions of onDigitalCrown
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let listDigitalCrown = await driver.findComponent(ON.id('text02'));
      let text = await (listDigitalCrown?.getText() as Promise<string>);
      console.info("[ArkUI_Stage_List_OnDigitalCrown_Static_0600] listDigitalCrown: " + text);
      expect(text).assertEqual('testCrowntext2');

      console.info('[ArkUI_Stage_List_OnDigitalCrown_Static_0600] END');
      done();
    });
  })
}
