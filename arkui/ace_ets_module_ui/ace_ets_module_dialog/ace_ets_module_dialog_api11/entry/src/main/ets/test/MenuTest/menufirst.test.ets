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
export default function menuTest() {
  describe('ActsMenuFirstTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menufirst",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menufirst state success " + JSON.stringify(pages));
        if (!("menufirst" == pages.name)) {
          console.info("get menufirst state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push menufirst page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menufirst page error " + JSON.stringify(err));
      }
      await sleep(2000)
      done()
    });

   /**
     * @tc.number ArkUX_Stage_Menu_EnableArrow_0100
     * @tc.name Tests whether the directional menu arrow is displayed
     * @tc.desc Tests whether the directional menu arrow is displayed
     */
    it('ArkUX_Stage_Menu_EnableArrow_0100', Level.LEVEL2, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("menu"))
      console.info('ArkUX_Stage_Menu_EnableArrow_0100 enableArrow :' + JSON.stringify(obj.$attrs.enableArrow));
      expect(obj.$attrs.enableArrow).assertEqual(undefined)
    })

    /**
     * @tc.number ArkUX_Stage_Menu_ArrowOffset_0100
     * @tc.name Test directional menu arrow shows location distance
     * @tc.desc Test directional menu arrow shows location distance
     */
    it('ArkUX_Stage_Menu_ArrowOffset_0100', Level.LEVEL2, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("menu"))
      console.info('ArkUX_Stage_Menu_ArrowOffset_0100 arrowOffset :' + JSON.stringify(obj.$attrs.arrowOffset));
      expect(obj.$attrs.arrowOffset).assertEqual(undefined)
    })
  })
}