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

import { beforeEach, describe, expect, it, Level} from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function NativeXComponent_RegisterKeyEventCallbackWithResultTest(){

  describe('NativeXComponent_RegisterKeyEventCallbackWithResultTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_RETURN_KEY_0130
     * @tc.name       : NativeXComponent_RegisterKeyEventCallbackWithResultTest001
     * @tc.desc       : testing OH_NativeXComponent_RegisterKeyEventCallbackWithResult
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeXComponent_RegisterKeyEventCallbackWithResult001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNativeXComponent_RegisterKeyEventCallbackWithResult001()).assertEqual(0)
      done()
    })
  })
}