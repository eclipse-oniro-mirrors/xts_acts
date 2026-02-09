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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function EdgeOutlineWidthsPage() {
  describe('EdgeOutlineWidthsPage', () => {
    beforeEach(async (done: Function) => {
      console.info('EdgeOutlineWidthsPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EdgeOutlineWidthsPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EdgeOutlineWidthsPage state pages:' + JSON.stringify(pages));
        if (!('EdgeOutlineWidthsPage' == pages.name)) {
          console.info('get EdgeOutlineWidthsPage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push EdgeOutlineWidthsPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EdgeOutlineWidthsPage page error:' + err);
      }
      console.info('EdgeOutlineWidthsPage beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   EdgeOutlineWidthsPage_0100
     * @tc.number EdgeOutlineWidthsPage_0100
     * @tc.desc   test EdgeOutlineWidths and EdgeColors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EdgeOutlineWidthsPage_0100', Level.LEVEL2, async (done: Function) => {
      console.info('EdgeOutlineWidthsPage_0100 START');
      await CommonFunc.sleep(1000);

      let textObj = getInspectorByKey('testId');
      let colorLeft: string = JSON.parse(textObj)?.$attrs?.outlineColor?.left;
      let colorTop: string = JSON.parse(textObj)?.$attrs?.outlineColor?.top;
      let colorRight: string = JSON.parse(textObj)?.$attrs?.outlineColor?.right;
      let colorBottom: string = JSON.parse(textObj)?.$attrs?.outlineColor?.bottom;

      let outlineWidthLeft: string = JSON.parse(textObj)?.$attrs?.outlineWidth?.left;
      let outlineWidthTop: string = JSON.parse(textObj)?.$attrs?.outlineWidth?.top;
      let outlineWidthRight: string = JSON.parse(textObj)?.$attrs?.outlineWidth?.right;
      let outlineWidthBottom : string= JSON.parse(textObj)?.$attrs?.outlineWidth?.bottom;

      console.log('[EdgeOutlineWidthsPage_0100] outlineColor left: ', colorLeft)
      console.log('[EdgeOutlineWidthsPage_0100] outlineColor top: ', colorTop)
      console.log('[EdgeOutlineWidthsPage_0100] outlineColor right: ', colorRight)
      console.log('[EdgeOutlineWidthsPage_0100] outlineColor bottom: ', colorBottom)
      console.log('[EdgeOutlineWidthsPage_0100] outlineWidth left: ', outlineWidthLeft)
      console.log('[EdgeOutlineWidthsPage_0100] outlineWidth top: ', outlineWidthTop)
      console.log('[EdgeOutlineWidthsPage_0100] outlineWidth right: ', outlineWidthRight)
      console.log('[EdgeOutlineWidthsPage_0100] outlineWidth bottom: ', outlineWidthBottom)

      expect(colorLeft).assertEqual('#FFFFC903');
      expect(colorTop).assertEqual('#FFFF0000');
      expect(colorRight).assertEqual('#FFAFEEEE');
      expect(colorBottom).assertEqual('#FF000000');
      expect(outlineWidthLeft).assertEqual('20.00px');
      expect(outlineWidthTop).assertEqual('40.00lpx');
      expect(outlineWidthRight).assertEqual('10.00fp');
      expect(outlineWidthBottom).assertEqual('80.00vp');

      console.info('EdgeOutlineWidthsPage_0100 END');
      done();
    });
  })
}