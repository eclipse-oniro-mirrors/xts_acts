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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';
import nativeRender from 'libnativerender.so'

async function fling_p(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  await driver.fling({x: Math.round(rect.left + vp2px(40)), y: Math.round(rect.top + vp2px(70))},
    {x: Math.round(rect.left + vp2px(40)), y: Math.round(rect.top + vp2px(10))},5,600);

}

export default function scrollScrollEventTest() {

  describe('ScrollScrollEventTest', () => {

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0100
    * @tc.name       : testScrollScrollEvent001
    * @tc.desc       : testing OnWillScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventOnWillScrollTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await fling_p('OnWillScroll')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnWillScroll').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0200
    * @tc.name       : testScrollScrollEvent002
    * @tc.desc       : testing OnDidScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventOnDidScrollTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await fling_p('OnDidScroll')
      await Utils.sleep(5000)
      expect(Utils.getComponentInfoByKey('OnDidScroll').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0300
    * @tc.name       : testScrollScrollEvent003
    * @tc.desc       : testing OnReachStart
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventOnReachStartTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnReachStart').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0400
    * @tc.name       : testScrollScrollEvent004
    * @tc.desc       : testing OnReachEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventOnReachEndTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await fling_p('OnReachEnd')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnReachEnd').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0500
    * @tc.name       : testScrollScrollEvent005
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy001Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy001').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0600
    * @tc.name       : testScrollScrollEvent006
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy002Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy002').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0700
    * @tc.name       : testScrollScrollEvent007
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy003Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy003').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0800
    * @tc.name       : testScrollScrollEvent008
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent008', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy004Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy004').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_0900
    * @tc.name       : testScrollScrollEvent009
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent009', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy005Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy005').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_1000
    * @tc.name       : testScrollScrollEvent010
    * @tc.desc       : testing ScrollBy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent010', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventScrollBy006Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollBy006').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLL_EVENT_1100
    * @tc.name       : testScrollScrollEvent011
    * @tc.desc       : testing OnWillDidScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEvent011', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEventOnWillDidScrollTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await fling_p('OnWillDidScroll')
      Utils.sleep(5000)
      let dataArray: number[][] = nativeRender.getOnWillDidDataTest();
      let OnScrollStart: number[] = dataArray[0];
      let OnScrollEnd: number[] = dataArray[1];
      expect(OnScrollStart[0] == 1 && OnScrollEnd[0] == 2).assertEqual(true)
      expect(Utils.getComponentInfoByKey('OnWillDidScroll').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      done()
    })
  })
}