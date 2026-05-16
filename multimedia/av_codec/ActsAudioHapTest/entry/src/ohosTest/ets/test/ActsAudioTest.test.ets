/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium"
import audioNapi from "libentry.so"
import Utils, { Log } from "./Util.test"

const fileArr = [
  "aac_2c_44100hz_199k.pcm"
]

export default function AudioTest() {
  describe('AcstAudioTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   EncoderConfigureLCAAC
     * @tc.number EncoderConfigureLCAAC
     * @tc.desc   EncoderConfigureLCAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureLCAAC', Level.LEVEL1, async (done: Function) => {
      const result: number = await audioNapi.EncoderConfigureLCAAC();
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureHEAAC
     * @tc.number EncoderConfigureHEAAC
     * @tc.desc   EncoderConfigureHEAAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureHEAAC', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureHEAAC()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureHEAACv2
     * @tc.number EncoderConfigureHEAACv2
     * @tc.desc   EncoderConfigureHEAACv2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureHEAACv2', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureHEAACv2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   EncoderConfigureByCap
     * @tc.number EncoderConfigureByCap
     * @tc.desc   EncoderConfigureByCap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EncoderConfigureByCap', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.EncoderConfigureByCap()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   SampleRate
     * @tc.number SampleRate
     * @tc.desc   SampleRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SampleRate', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.SampleRate()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   ChannelCountV1
     * @tc.number ChannelCountV1
     * @tc.desc   ChannelCountV1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChannelCountV1', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.ChannelCountV1()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   ChannelCountV2
     * @tc.number ChannelCountV2
     * @tc.desc   ChannelCountV2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChannelCountV2', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.ChannelCountV2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   ChannelLayoutV1
     * @tc.number ChannelLayoutV1
     * @tc.desc   ChannelLayoutV1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChannelLayoutV1', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.ChannelLayoutV1()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   ChannelLayoutV2
     * @tc.number ChannelLayoutV2
     * @tc.desc   ChannelLayoutV2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChannelLayoutV2', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.ChannelLayoutV2()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   AacProfile
     * @tc.number AacProfile
     * @tc.desc   AacProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AacProfile', Level.LEVEL1, async (done: Function) => {
      const result = await audioNapi.AacProfile()
      expect(result).assertEqual(0)
      done();
    })

  })
}