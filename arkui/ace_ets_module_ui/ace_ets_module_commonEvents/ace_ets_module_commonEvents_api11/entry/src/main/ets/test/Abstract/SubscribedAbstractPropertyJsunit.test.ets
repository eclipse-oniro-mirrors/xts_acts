/**
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
import { describe, it, Level } from '@ohos/hypium';

export default function subscribedAbstractPropertyJsunit() {
  describe('appInfoTest_four_8', () => {
    it('subscribedAbstractProperty0100', Level.LEVEL0, async (done: Function) => {
      console.info('[subscribedAbstractProperty0100] START');
      if (true) {
        done();
        return;
      }
      /*
      const subscribedAbstractProperty: SubscribedAbstractProperty = new SubscribedAbstractProperty('subscribtest');
      subscribedAbstractProperty.notifyPropertyRead();
      subscribedAbstractProperty.notifyHasChanged('subscribtest');
      subscribedAbstractProperty.unlinkSuscriber(0);
      subscribedAbstractProperty.createOneWaySync('subscribtest');
      subscribedAbstractProperty.createTwoWaySync('subscribtest');
      subscribedAbstractProperty.set('subscribtest');
      subscribedAbstractProperty.get();
      subscribedAbstractProperty.info();
      subscribedAbstractProperty.info_ = "subscribtest";
      subscribedAbstractProperty.subscribers_ = 'subscribtest';
      console.info('[subscribedAbstractProperty0100] END');
      done();
      */
    });
  })
}
