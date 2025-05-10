/**
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

import scrollBy from "./GridTest/Grid_iiregular/scrollBy.test";
import scrollEge from "./GridTest/Grid_iiregular/scrollEge.test";
import scrollPage from "./GridTest/Grid_iiregular/scrollPage.test";
import scrollTo from "./GridTest/Grid_iiregular/scrollTo.test";
import StartAndEnd from './GridTest/Grid_iiregular/StartAndEnd.test';
import StartAndStop from './GridTest/Grid_iiregular/StartAndStop.test';
import listItem_SizeChange from './ListTest/List_Space/ListItemChange/ListItem_SizeChange.test.ets';
import listItem_Margin from './ListTest/List_Space/ListItemChange/ListItem_Margin.test.ets';
import listItem_Padding from './ListTest/List_Space/ListItemChange/ListItem_Padding.test.ets';
import listItem_PadMar from './ListTest/List_Space/ListItemChange/ListItem_PadMar.test.ets';
import listItem_Visibility from './ListTest/List_Space/ListItemChange/ListItem_Visibility.test.ets';
import listItem_Position from './ListTest/List_Space/ListItemChange/ListItem_Position.test.ets';
import listItem_Offset from './ListTest/List_Space/ListItemChange/ListItem_Offset.test.ets';
import listItem_InSertChange from './ListTest/List_Space/ListItemChange/ListItem_InSertChange.test.ets';
import list_SpaceChangeTest from './ListTest/List_SpaceChange/List_SpaceChange.test';
import list_ListInitialIndex1Test from './ListTest/List_initialIndex/List_ListInitialIndex1.test';
import list_ListInitialIndex2Test from './ListTest/List_initialIndex/List_ListInitialIndex2.test';
import list_ListInitialIndex3Test from './ListTest/List_initialIndex/List_ListInitialIndex3.test';
import list_ListInitialIndex4Test from './ListTest/List_initialIndex/List_ListInitialIndex4.test';
import list_ListInitialIndex5Test from './ListTest/List_initialIndex/List_ListInitialIndex5.test';
import list_ListInitialIndex6Test from './ListTest/List_initialIndex/List_ListInitialIndex6.test';
import List_alignListItem from './ListTest/List_Space/ListChange/List_alignListItem.test';
import List_divider from './ListTest/List_Space/ListChange/List_divider.test';
import List_lanes_1 from './ListTest/List_Space/ListChange/List_lanes_1.test';
import List_lanes from './ListTest/List_Space/ListChange/List_lanes.test';
import List_ListDirection from './ListTest/List_Space/ListChange/List_ListDirection.test';
import List_ListSize from './ListTest/List_Space/ListChange/List_ListSize.test';
import List_Margin from './ListTest/List_Space/ListChange/List_Margin.test';
import List_Padding from './ListTest/List_Space/ListChange/List_Padding.test';
import List_PadMar from './ListTest/List_Space/ListChange/List_PadMar.test';
import list_ListFrictionTest from './ListTest/List_attribute/List_ListFriction.test';
import ListItem_Delete_End from './ListTest/ListItem_Delete/ListItem_Delete_End.test.ets';
import ListItem_Delete_End_Default from './ListTest/ListItem_Delete/ListItem_Delete_End_Default.test.ets';
import ListItem_Delete_End_String from './ListTest/ListItem_Delete/ListItem_Delete_End_String.test.ets';
import ListItem_Delete_End_Resource from './ListTest/ListItem_Delete/ListItem_Delete_End_Resource.test.ets';
import ListItem_Delete_Start from './ListTest/ListItem_Delete/ListItem_Delete_Start.test.ets';
import ListItem_Delete_Start_Default from './ListTest/ListItem_Delete/ListItem_Delete_Start_Default.test.ets';
import ListItem_Delete_Start_String from './ListTest/ListItem_Delete/ListItem_Delete_Start_String.test.ets';
import ListItem_Delete_Start_Resource from './ListTest/ListItem_Delete/ListItem_Delete_Start_Resource.test.ets';
import List_scrollToIndex1 from './ListTest/List_scrollToIndex/List_scrollToIndex1.test';
import List_scrollToIndex2 from './ListTest/List_scrollToIndex/List_scrollToIndex2.test';
import List_scrollToIndex3 from './ListTest/List_scrollToIndex/List_scrollToIndex3.test';
import List_Space_Percentage from './ListTest/List_SpaceChange/List_Space_Percentage.test';
import listItemGroup_Space_Percentage from './ListTest/List_SpaceChange/listItemGroup_Space_Percentage.test';
import List_aspectRatio_width from './ListTest/List_aspectRatio/List_aspectRatio/List_aspectRatio_width.test';
import List_aspectRatio_height from './ListTest/List_aspectRatio/List_aspectRatio/List_aspectRatio_height.test';
import List_aspectRatio_all from './ListTest/List_aspectRatio/List_aspectRatio/List_aspectRatio_all.test';
import List_aspectRatio_neither from './ListTest/List_aspectRatio/List_aspectRatio/List_aspectRatio_neither.test';
import ListItem_aspectRatio_width from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width.test';
import ListItem_aspectRatio_height from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_height.test';
import ListItem_aspectRatio_all from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_all.test';
import ListItem_aspectRatio_neither
  from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_neither.test';
import ListItem_aspectRatio_width2 from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width2.test';
import ListItem_aspectRatio_height2
  from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_height2.test';
import ListItem_aspectRatio_all2 from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_all2.test';
import ListItem_aspectRatio_neither2
  from './ListTest/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_neither2.test';
import ListItemGroup_aspectRatio_width
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_width.test';
import ListItemGroup_aspectRatio_height
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_height.test';
import ListItemGroup_aspectRatio_all
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_all.test';
import ListItemGroup_aspectRatio_neither
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_neither.test';
import ListItemGroup_aspectRatio_width2
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_width2.test';
import ListItemGroup_aspectRatio_height2
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_height2.test';
import ListItemGroup_aspectRatio_all2
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_all2.test';
import ListItemGroup_aspectRatio_neither2
  from './ListTest/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_neither2.test';
import List_divider_number from './ListTest/List_divider/List_divider_number.test';
import List_divider_string from './ListTest/List_divider/List_divider_string.test';
import List_strokeWidth from './ListTest/List_divider/List_strokeWidth.test';
import List_divider_resource from './ListTest/List_divider/List_divider_resource.test';
import listSwipeActionJsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction.test';
import listSwipeNoActionJsunit from './ListTest/ListItem_SwipeActionITem/listSwipeNoAction.test'
import listSwipe06Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipe06.test'
import listSwipeActionEndJsunit from './ListTest/ListItem_SwipeActionITem/listSwipeActionEnd.test'
import listSwipeAction12EndJsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction12End.test'
import listSwipeAction13EndJsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction13End.test'
import listSwipeAction15Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction15.test'
import listSwipeAction19Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction19.test'
import listSwipeAction20Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction20.test'
import listSwipeAction23Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction23.test'
import listSwipeAction27Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction27.test'
import listSwipeAction28Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction28.test'
import listSwipeAction29Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction29.test'
import listSwipeAction34Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction34.test'
import listSwipeAction36Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction36.test'
import listSwipeAction41Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction41.test'
import listSwipeAction43Jsunit from './ListTest/ListItem_SwipeActionITem/listSwipeAction43.test'
import ListOffSet01Jsunit from './ListTest/List_attribute/ListOffSet01Jsunit.test';
import ListJsunit from './ListTest/ListJsunit.test.ets';
import ListLanes from './ListTest/ListLanes.test';
import ListLanes02 from './ListTest/ListLanes02.test';
import ListLanes03 from './ListTest/ListLanes03.test.ets';
import ListLanes04 from './ListTest/ListLanes04.test.ets';
import ListLanes05 from './ListTest/ListLanes05.test.ets';

export default function testsuite() {
  scrollBy()
  scrollEge()
  scrollPage()
  scrollTo()
  StartAndEnd()
  StartAndStop()
  listItem_SizeChange()
  listItem_Margin()
  listItem_Padding()
  listItem_PadMar()
  listItem_Visibility()
  listItem_Position()
  listItem_Offset()
  listItem_InSertChange()
  list_ListInitialIndex1Test();
  list_ListInitialIndex2Test();
  list_ListInitialIndex3Test();
  list_ListInitialIndex4Test();
  list_ListInitialIndex5Test();
  list_ListInitialIndex6Test();
  list_SpaceChangeTest();
  List_alignListItem();
  List_divider();
  List_lanes_1();
  List_lanes();
  List_ListDirection();
  List_ListSize();
  List_Margin();
  List_Padding();
  List_PadMar();
  list_ListFrictionTest();
  ListItem_Delete_End()
  ListItem_Delete_End_Default()
  ListItem_Delete_End_String()
  ListItem_Delete_End_Resource()
  ListItem_Delete_Start()
  ListItem_Delete_Start_Default()
  ListItem_Delete_Start_String()
  ListItem_Delete_Start_Resource()
  List_scrollToIndex1()
  List_scrollToIndex2()
  List_scrollToIndex3()
  List_Space_Percentage();
  listItemGroup_Space_Percentage();
  List_aspectRatio_width();
  List_aspectRatio_height();
  List_aspectRatio_all();
  List_aspectRatio_neither();
  ListItem_aspectRatio_width();
  ListItem_aspectRatio_height();
  ListItem_aspectRatio_all();
  ListItem_aspectRatio_neither();
  ListItem_aspectRatio_width2();
  ListItem_aspectRatio_height2();
  ListItem_aspectRatio_all2();
  ListItem_aspectRatio_neither2();
  ListItemGroup_aspectRatio_width();
  ListItemGroup_aspectRatio_height();
  ListItemGroup_aspectRatio_all();
  ListItemGroup_aspectRatio_neither();
  ListItemGroup_aspectRatio_width2();
  ListItemGroup_aspectRatio_height2();
  ListItemGroup_aspectRatio_all2();
  ListItemGroup_aspectRatio_neither2();
  List_divider_number();
  List_divider_string();
  List_strokeWidth();
  List_divider_resource();
  listSwipeActionJsunit()
  listSwipeNoActionJsunit()
  listSwipe06Jsunit()
  listSwipeActionEndJsunit()
  listSwipeAction12EndJsunit()
  listSwipeAction13EndJsunit()
  listSwipeAction15Jsunit()
  listSwipeAction19Jsunit()
  listSwipeAction20Jsunit()
  listSwipeAction23Jsunit()
  listSwipeAction27Jsunit()
  listSwipeAction28Jsunit()
  listSwipeAction29Jsunit()
  listSwipeAction36Jsunit()
  listSwipeAction41Jsunit()
  listSwipeAction43Jsunit()
  ListOffSet01Jsunit()
  ListJsunit();
  ListLanes();
  ListLanes02(); 
  ListLanes03();
  ListLanes04();
  ListLanes05();
}