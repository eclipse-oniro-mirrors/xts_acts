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

import { beforeEach, expect, describe, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function radioCheckedTest() {

  describe('RadioCheckedTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0100
     * @tc.name       : testRadioChecked001
     * @tc.desc       : testing Checked for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked001', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0200
     * @tc.name       : testRadioChecked002
     * @tc.desc       : testing Checked for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked002', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0300
     * @tc.name       : testRadioChecked003
     * @tc.desc       : testing Checked for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked003', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0400
     * @tc.name       : testRadioChecked004
     * @tc.desc       : testing Checked for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked004', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0500
     * @tc.name       : testRadioChecked005
     * @tc.desc       : testing Checked for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked005', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0600
     * @tc.name       : testRadioChecked006
     * @tc.desc       : testing Checked for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked006', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked006()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0700
     * @tc.name       : testRadioChecked007
     * @tc.desc       : testing Checked for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioChecked007', 0, async (done: Function) => {
      expect(nativeFunc.testRadioChecked007()).assertEqual(0)
      done();
    })
  })
}
