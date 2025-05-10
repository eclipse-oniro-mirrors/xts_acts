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
 
import AddContactTest from './AddContact.test';
import QueryByEmailTest from './QueryByEmail.test';
import QueryKeyTest from './QueryKey.test';
import QueryByEmailPhoneNumTest from './QueryByPhoneNum.test';
import QueryContactTest from './QueryContact.test';
import UpdateContactTest from './UpdateContact.test';
import IsMyCardTest from './IsMyCard.test';
import ContactTest from './Contact.test';
import QueryGroupsTest from './QueryGroups.test';
import EmptyTest from './Empty.test';
import ContactsTest from './Contacts.test';
import AddContactViaUITest from './AddContactViaUI.test';
import SaveToExistingContactViaUITest from './SaveToExistingContactViaUI.test';
import SelectContactsTest from './SelectContacts.test';
import { deviceInfo } from '@kit.BasicServicesKit'
import sim from '@ohos.telephony.sim';

export default function testsuite() {
  if (sim.getMaxSimCount()!=0){
    AddContactTest();
    QueryKeyTest();
    QueryByEmailTest();
    QueryByEmailPhoneNumTest();
    QueryContactTest();
    UpdateContactTest();
    QueryGroupsTest();
    IsMyCardTest();
    ContactTest();
    ContactsTest()
  }else{
    EmptyTest()
  }
}
