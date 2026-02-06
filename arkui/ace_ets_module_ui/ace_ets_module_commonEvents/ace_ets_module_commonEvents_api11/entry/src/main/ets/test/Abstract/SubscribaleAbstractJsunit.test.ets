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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function SubscribaleAbstractJsunit() {
  describe('SubscribaleAbstract', () =>{

    /**
     * @tc.name   stateManagement_SubscribaleAbstract_addOwningProperty_0100
     * @tc.number stateManagement_SubscribaleAbstract_setOrCreate_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_SubscribaleAbstract_addOwningProperty_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_SubscribaleAbstract_addOwningProperty_0100] START');
      let subscriber = new IPropertySubscriber();
      let abstract = new SubscribaleAbstract();
      abstract.addOwningProperty(subscriber);
      let numbers = abstract.owningProperties_;
      abstract.removeOwningProperty(subscriber)
      abstract.removeOwningPropertyById(1);
      abstract.notifyPropertyHasChanged("key1", "value1");
      expect(true).assertTrue();
      console.info('[stateManagement_SubscribaleAbstract_addOwningProperty_0100] END');
      done();
      */
    });

    /**
     * @tc.name   stateManagement_ISinglePropertyChangeSubscriber_hasChanged_0100
     * @tc.number stateManagement_ISinglePropertyChangeSubscriber_hasChanged_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_ISinglePropertyChangeSubscriber_hasChanged_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_ISinglePropertyChangeSubscriber_hasChanged_0100] START');
      let subscriber = new ISinglePropertyChangeSubscriber<string>(
        (data) => {
          console.info('[stateManagement_SubscribaleAbstract_addOwningProperty_0100] data = ' + data);
        }
      );
      expect(true).assertTrue();
      console.info('[stateManagement_ISinglePropertyChangeSubscriber_hasChanged_0100] END');
      done();
      */
    });

    /**
     * @tc.name   stateManagement_PersistentStorage_0100
     * @tc.number stateManagement_PersistentStorage_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_PersistentStorage_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_PersistentStorage_0100] Start');
      let persistentStorage = new PersistentStorage(AppStorage, new Storage());
      persistentStorage.PersistProp<string>("key10", "value10");
      let persistProp = {
        "properties": [{
                         key: "colorMode", defaultValue: ColorMode.LIGHT
                       }, {
                         key: "layoutDirection", defaultValue: LayoutDirection.LTR
                       }]
      };
      persistentStorage.PersistProps(persistProp);IPropertySubscriber
      persistentStorage.DeleteProp("colorMode");
      expect(true).assertTrue();
      console.info('[stateManagement_PersistentStorage_0100] END');
      done();
      */
    });

    /**
     * @tc.name   stateManagement_IPropertySubscriber_0100
     * @tc.number stateManagement_IPropertySubscriber_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_IPropertySubscriber_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_IPropertySubscriber_0100] Start');
      let iPropertySubscriber =new IPropertySubscriber();
      let id = iPropertySubscriber.id();
      let aboutToBeDeleted = iPropertySubscriber.aboutToBeDeleted();
      expect(true).assertTrue();
      console.info('[stateManagement_IPropertySubscriber_0100] END');
      done();
      */
    });
    
    /**
     * @tc.name   stateManagement_SyncedPropertyOneWay_0100
     * @tc.number stateManagement_SyncedPropertyOneWay_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_SyncedPropertyOneWay_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_SyncedPropertyOneWay_0100] Start');
      let oneWay = new SyncedPropertyOneWay(new SubscribedAbstractProperty<string>());
      oneWay.set("key12");
      let key12 = oneWay.get();
      oneWay.hasChanged("key12");
      oneWay.aboutToBeDeleted(new SubscribedAbstractProperty<string>());
      let source_ = oneWay.source_;
      let wrappedValue_ = oneWay.oneWay;
      expect(true).assertTrue();
      console.info('[stateManagement_SyncedPropertyOneWay_0100] END');
      done();
      */
    });

    /**
     * @tc.name   stateManagement_SyncedPropertyTwoWay_0100
     * @tc.number stateManagement_SyncedPropertyTwoWay_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_SyncedPropertyTwoWay_0100', Level.LEVEL0, (done:Function) =>{
      done();
      return;
      /*
      console.info('[stateManagement_SyncedPropertyTwoWay_0100] Start');
      let twoWay = new SyncedPropertyTwoWay(new SubscribedAbstractProperty<string>());
      twoWay.set("key12");
      let key12 = twoWay.get();
      twoWay.hasChanged("key12");
      twoWay.aboutToBeDeleted(new SubscribedAbstractProperty<string>());
      let source_ = twoWay.source_;
      let wrappedValue_ = twoWay.oneWay;
      expect(true).assertTrue();
      console.info('[stateManagement_SyncedPropertyTwoWay_0100] END');
      done();
      */
    });
  })
}
