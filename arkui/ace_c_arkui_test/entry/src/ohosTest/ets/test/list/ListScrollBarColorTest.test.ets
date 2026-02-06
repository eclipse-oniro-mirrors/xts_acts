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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { resourceManager } from '@kit.LocalizationKit';

function mergeToARGB(sysColor: Resource, sysAlpha: Resource) {
    let resourceColor = getContext().resourceManager.getColorSync(sysColor.id);
    let color: string = resourceColor.toString(16).toUpperCase();
    let resourceAlpha = getContext().resourceManager.getNumber(sysAlpha.id);
    let alpha = Math.round(resourceAlpha * 255);

    let r: number, g: number, b: number;
    if (color.length === 6) {
      // 6位颜色：RRGGBB
      r = parseInt(color.substring(0, 2), 16);
      g = parseInt(color.substring(2, 4), 16);
      b = parseInt(color.substring(4, 6), 16);
    } else {
      // 8位颜色：AARRGGBB - 忽略原有的透明度，使用新的百分比透明度
      r = parseInt(color.substring(2, 4), 16);
      g = parseInt(color.substring(4, 6), 16);
      b = parseInt(color.substring(6, 8), 16);
    }
    let argb = (alpha << 24) | (r << 16) | (g << 8) | b;
    let newArgb = '#' + argb.toString(16).toUpperCase();
    return newArgb;
}

export default function listScrollBarColorTest() {

  describe('ListScrollBarColorTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_COLOR_0001
     * @tc.name       : testListScrollBarColor001
     * @tc.desc       : testing scrollbarcolr for list with yellow value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarColor001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBarColor001Test`);
      await Utils.sleep(500)
      console.info('testListScrollBarColor001  START');
      await Utils.clickComponent('listId1')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('listId1');
      console.info('testListScrollBarColor001 strJson:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("testListScrollBarColor001 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("testListScrollBarColor001 component obj.$attrs.scrollBarColor is: " + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertEqual(Color.Yellow.toString().toUpperCase())
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_COLOR_0002
     * @tc.name       : testListScrollBarColor002
     * @tc.desc       : testing scrollbarcolr for list with red value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarColor002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBarColor002Test`);
      await Utils.sleep(500)
      console.info('testListScrollBarColor002  START');
      await Utils.clickComponent('listId2')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('listId2');
      console.info('testListScrollBarColor002 strJson:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("testListScrollBarColor002 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("testListScrollBarColor002 component obj.$attrs.scrollBarColor is: " + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertEqual(Color.Red.toString().toUpperCase())
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_COLOR_0003
     * @tc.name       : testListScrollBarColor003
     * @tc.desc       : testing scrollbarcolr for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarColor003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBarColor003Test`);
      await Utils.sleep(500)
      console.info('testListScrollBarColor003  START');
      await Utils.clickComponent('listId3')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('listId3');
      console.info('testListScrollBarColor003 strJson:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      let sysARGB: string = mergeToARGB($r('sys.color.scrollbar_color_foreground'), $r('sys.float.scroll_bar_foreground_opacity'));
      console.info("testListScrollBarColor003 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("testListScrollBarColor003 component obj.$attrs.scrollBarColor is: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("testListScrollBarColor003 component sys scrollBarColor is: " + sysARGB);
      expect(obj.$attrs.scrollBarColor).assertEqual(sysARGB)
      done()
    })
  })
}
