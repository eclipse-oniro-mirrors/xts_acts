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
import AVSessionAVCast from './AVSessionAVCast.test'
import AVSessionERRCode from './AVSessionERRCode.test'
import AVSessionEnum from './AVSessionEnum.test'
import AVCastController from './AVCastController.test'


export default function testsuite() {
  AVSessionAVCast()
  AVSessionERRCode()
  AVSessionEnum()
  AVCastController()
}


  /**
   * This test suite contains testcases for these interface:
   *
   * @AVSessionAVCast
   * resetCommunicationDevice()
   * select(options?: AVCastPickerOptions)
   *
   * @AVCastController
   *
   *
   */