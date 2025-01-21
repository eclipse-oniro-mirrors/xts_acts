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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

export default function ContentStorageJsunit() {
  describe('AppStorage', () => {

    /**
     * @tc.number stateManagement_ContentStorage_setOrCreate_0100
     * @tc.name stateManagement AppStorage  setOrCreate validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_setOrCreate_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_setOrCreate_0100] START');
      AppStorage.setOrCreate<string>("key1", "value");
      AppStorage.setOrCreate<number>("key2", 11);
      AppStorage.setOrCreate<boolean>("key3", true);
      let key1 = AppStorage.get<string>("key1");
      let key2 = AppStorage.get<number>("key2");
      let key3 = AppStorage.get<boolean>("key3");
      expect(key1).assertEqual("value");
      expect(key2 == 11)
        .assertTrue;
      expect(key3)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_setOrCreate_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_get_0100
     * @tc.name stateManagement AppStorage  get validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_get_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_get_0100] START');
      let size = AppStorage.size();
      let key1 = AppStorage.get<string>("key1");
      let key2 = AppStorage.get<number>("key2");
      let key3 = AppStorage.get<boolean>("key3");
      expect(key1).assertEqual("value");
      expect(key2 == 11)
        .assertTrue;
      expect(key3)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_get_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_size_0100
     * @tc.name stateManagement AppStorage  size validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_size_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_size_0100] START');
      let size = AppStorage.size();
      expect(size == 3)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_size_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_has_0100
     * @tc.name stateManagement AppStorage  has validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_has_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_has_0100] START');
      let hasKey1 = AppStorage.has("key1");
      let hasKey2 = AppStorage.has("key2");
      let hasKey3 = AppStorage.has("key3");
      let hasKey4 = AppStorage.has("key4");
      expect(hasKey1)
        .assertTrue;
      expect(hasKey2)
        .assertTrue;
      expect(hasKey3)
        .assertTrue;
      expect(hasKey4)
        .assertFail;
      console.info('[stateManagement_ContentStorage_has_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_set_0100
     * @tc.name stateManagement AppStorage  set validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_set_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_set_0100] START');
      AppStorage.set<string>("key1", "value11");
      AppStorage.set<number>("key2", 12);
      AppStorage.set<boolean>("key3", false);
      AppStorage.set<string>("key4", "value4");
      let key1 = AppStorage.get<string>("key1");
      let key2 = AppStorage.get<number>("key2");
      let key3 = AppStorage.get<boolean>("key3");
      let key4 = AppStorage.get<string>("key4");

      let link: SubscribedAbstractProperty<string> = AppStorage.link("key1");
      let prop: SubscribedAbstractProperty<string> = AppStorage.prop("key1");
      let isMutable: boolean = AppStorage.IsMutable("key1");
      console.info('[stateManagement_ContentStorage_set_0100] link = ' + link);
      console.info('[stateManagement_ContentStorage_set_0100] prop = ' + prop);
      console.info('[stateManagement_ContentStorage_set_0100] isMutable = ' + isMutable);

      expect(key1).assertEqual("value11");
      expect(key2 == 12)
        .assertTrue;
      expect(!key3)
        .assertTrue;
      expect(key4 == null)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_set_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_isMutable_0100
     * @tc.name stateManagement AppStorage  isMutable validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_isMutable_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_isMutable_0100] START');
      let isMutable: boolean = AppStorage.IsMutable("key1");
      console.info('[stateManagement_ContentStorage_set_0100] isMutable = ' + isMutable);
      expect(isMutable)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_set_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_keys_0100
     * @tc.name stateManagement AppStorage  keys validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_keys_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_keys_0100] START');
      let keys = AppStorage.keys();
      console.info('[stateManagement_ContentStorage_keys_0100] keys = ' + keys);
      console.info('[stateManagement_ContentStorage_keys_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_delete_0100
     * @tc.name stateManagement AppStorage  delete validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_delete_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_delete_0100] START');
      let isDelete = AppStorage.delete("key1");
      expect(isDelete)
        .assertTrue;
      let size = AppStorage.size();
      expect(size == 2)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_delete_0100] END');
      done();
    });

    /**
     * @tc.number stateManagement_ContentStorage_clear_0100
     * @tc.name stateManagement AppStorage  clear validation
     * @tc.desc Function test
     */
    it('stateManagement_ContentStorage_clear_0100', 0, (done: Function) => {
      console.info('[stateManagement_ContentStorage_clear_0100] START');
      let isClear = AppStorage.clear();
      expect(isClear)
        .assertTrue;
      let size = AppStorage.size();
      expect(size == 0)
        .assertTrue;
      console.info('[stateManagement_ContentStorage_clear_0100] END');
      done();
    });
  })
}
