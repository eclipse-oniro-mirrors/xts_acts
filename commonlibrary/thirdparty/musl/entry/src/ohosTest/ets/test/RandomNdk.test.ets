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
import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import random from 'librandomndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


export default function muslRandomNdkTest() {
  describe('MuslRandomTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**getopt
     * @tc.number   : SUB_THIRDPARTY_MUSL_RANDOM_GETRANDOM_0100
     * @tc.name     : testMuslRandomGetrandom001
     * @tc.desc     : test getrandom
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslRandomGetrandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret:number = random.getrandom();
      expect(ret).assertEqual(0)
      done()
    });
  })
}
