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

export default function xComponentIdTest() {

  describe('XComponentIdTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_ID_0100
     * @tc.name       : testXComponentId001
     * @tc.desc       : testing Id for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentId001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'XComponentId001Test';
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('xcomponent001')).$attrs.width).assertEqual('100.00vp')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_ID_0200
     * @tc.name       : testXComponentId002
     * @tc.desc       : testing Id for XComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentId002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'XComponentId002Test';
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('xcomponent002')).$attrs.width).assertEqual('100.00vp')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_ID_0300
     * @tc.name       : testXComponentId003
     * @tc.desc       : testing Id for XComponent with null value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentId003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'XComponentId003Test';
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('xcomponent003')).$attrs.width).assertEqual('100.00vp')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_ID_0400
     * @tc.name       : testXComponentId004
     * @tc.desc       : testing Id for XComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentId004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'XComponentId004Test';
      await Utils.pushPage(`xcomponent/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('xcomponent004')).$attrs.width).assertEqual('100.00vp')
      done()
    })

  })
}