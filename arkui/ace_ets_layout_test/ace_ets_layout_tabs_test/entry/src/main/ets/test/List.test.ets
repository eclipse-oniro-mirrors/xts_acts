/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import Tabs_itemPadMar from './Tabs/Tabs_ItemsChange/Tabs_itemPadMar.test';
import Tabs_itemSize from './Tabs/Tabs_ItemsChange/Tabs_itemSize.test';
import tabs_IndexTest from './Tabs/tabs_index/Tabs_index.test';
import tabs_PadMarTest from './Tabs/Tabs_ParmsChange/Tabs_PadMar.test';
import tabs_WidHeiTest from './Tabs/Tabs_ParmsChange/Tabs_WidHei.test';
import Tabs_barMode from './Tabs/Tabs_ParmsChange/Tabs_barMode.test';
import Tabs_barPosition from './Tabs/Tabs_ParmsChange/Tabs_barPosition.test';
import Tabs_barWidHei  from './Tabs/Tabs_ParmsChange/Tabs_barWidHei.test';
import Tabs_scrollable from './Tabs/Tabs_ParmsChange/Tabs_scrollable.test';


export default function testsuite() {

  Tabs_itemPadMar();
  Tabs_itemSize();
  tabs_IndexTest();
  tabs_PadMarTest();
  tabs_WidHeiTest();
  Tabs_barMode();
  Tabs_barPosition();
  Tabs_barWidHei();
  Tabs_scrollable();
}