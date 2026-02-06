/*
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
export default function menuSecondTest() {
  describe('ActsMenuSecondTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menusecond",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menusecond state success " + JSON.stringify(pages));
        if (!("menusecond" == pages.name)) {
          console.info("get menusecond state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push menusecond page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menusecond page error " + JSON.stringify(err));
      }
      await sleep(2000)
      done()
    });

   /**
     * @tc.number ArkUX_Stage_Menu_Enabled_0100
     * @tc.name Tests whether the menu enabled is displayed
     * @tc.desc Tests whether the menu enabled is displayed
     */
    it('ArkUX_Stage_Menu_Enabled_0100', Level.LEVEL2, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("Menu"))
      console.info('ArkUX_Stage_Menu_Enabled_0100 bindMenuEnabled :' + JSON.stringify(obj.$attrs.bindMenuEnabled));
    })

    /**
     * @tc.number ArkUX_Stage_Menu_Preview_0100
     * @tc.name Test the hover menu preview display
     * @tc.desc Test the hover menu preview display
     */
    it('ArkUX_Stage_Menu_Preview_0100', Level.LEVEL2, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("floatingMenuImage"))
      console.info('ArkUX_Stage_Menu_Preview_0100 preview :' + JSON.stringify(obj.$attrs.preview));
    })

      /**
     * @tc.number ArkUX_Stage_Menu_Preview_0200
     * @tc.name Test the hover menu preview display
     * @tc.desc Test the hover menu preview display
     */
    it('ArkUX_Stage_Menu_Preview_0200', Level.LEVEL2, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("floatingMenuBuilder"))
      console.info('ArkUX_Stage_Menu_Preview_0200 preview :' + JSON.stringify(obj.$attrs.preview));
    })
  })
}