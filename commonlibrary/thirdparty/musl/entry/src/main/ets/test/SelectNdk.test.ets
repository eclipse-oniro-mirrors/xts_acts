/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, expect, it } from '@ohos/hypium'
import select from 'libselectndk.so'

export default function selectNdkTest() {
  describe('MuslSelectTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SELECT_SELECT_0100
     * @tc.name       : testMuslSelectSelect001
     * @tc.desc       : test select
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSelectSelect001', 0, async (done: Function) => {
      let testParam = 0
      let result:number = select.select(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SELECT_SELECT_0200
     * @tc.name       : testMuslSelectSelect002
     * @tc.desc       : test select
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSelectSelect002', 0, async (done: Function) => {
      let result:number = select.select(1);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SELECT_PSELECT_0100
     * @tc.name       : testMuslSelectPSelect001
     * @tc.desc       : test pselect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSelectPSelect001', 0, async (done: Function) => {
      let result:number = select.pSelect();
      console.info("Test NAPI data= " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });
  })
}
