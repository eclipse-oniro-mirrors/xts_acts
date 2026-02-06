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

import ListTestJsunit from './List/listTest.test';
import ListItemJsunit from './List/ListItem.test';
import ListCrownTest from './List/listCrownTest.test';
import ListAddJsunit from './List/ListAddJsunit.test';
import ListOffSet01Jsunit from './List/listOffSet01Jsunit.test';
import ListJsunit from './List/ListJsunit.test';
import ListFrictionTest from './List/ListFriction.test';
import ListLanes from './List/ListLanes.test';
import ListLanes02 from './List/ListLanes02.test';
import ListLanes03 from './List/ListLanes03.test';
import ListLanes04 from './List/ListLanes04.test';
import ListLanes05 from './List/ListLanes05.test';
import listItem_SizeChange from './List_Space/ListItemChange/ListItem_SizeChange.test';
import listItem_Margin from './List_Space/ListItemChange/ListItem_Margin.test';
import listItem_Padding from './List_Space/ListItemChange/ListItem_Padding.test';
import listItem_PadMar from './List_Space/ListItemChange/ListItem_PadMar.test';
import listItem_Visibility from './List_Space/ListItemChange/ListItem_Visibility.test';
import listItem_Position from './List_Space/ListItemChange/ListItem_Position.test';
import listItem_Offset from './List_Space/ListItemChange/ListItem_Offset.test';
import listItem_InSertChange from './List_Space/ListItemChange/ListItem_InSertChange.test';
import list_SpaceChangeTest from './List_SpaceChange/List_SpaceChange.test';
import list_ListInitialIndex1Test from './List_initialIndex/List_ListInitialIndex1.test';
import list_ListInitialIndex2Test from './List_initialIndex/List_ListInitialIndex2.test';
import list_ListInitialIndex3Test from './List_initialIndex/List_ListInitialIndex3.test';
import list_ListInitialIndex4Test from './List_initialIndex/List_ListInitialIndex4.test';
import list_ListInitialIndex5Test from './List_initialIndex/List_ListInitialIndex5.test';
import list_ListInitialIndex6Test from './List_initialIndex/List_ListInitialIndex6.test';
import List_alignListItem from './List_Space/ListChange/List_alignListItem.test';
import List_divider from './List_Space/ListChange/List_divider.test';
import List_lanes_1 from './List_Space/ListChange/List_lanes_1.test';
import List_lanes from './List_Space/ListChange/List_lanes.test';
import List_ListDirection from './List_Space/ListChange/List_ListDirection.test';
import List_ListSize from './List_Space/ListChange/List_ListSize.test';
import List_Margin from './List_Space/ListChange/List_Margin.test';
import List_Padding from './List_Space/ListChange/List_Padding.test';
import List_PadMar from './List_Space/ListChange/List_PadMar.test';
import ListItem_Delete_End from './ListItem_Delete/ListItem_Delete_End.test';
import ListItem_Delete_End_Default from './ListItem_Delete/ListItem_Delete_End_Default.test';
import ListItem_Delete_End_String from './ListItem_Delete/ListItem_Delete_End_String.test';
import ListItem_Delete_End_Resource from './ListItem_Delete/ListItem_Delete_End_Resource.test';
import ListItem_Delete_Start from './ListItem_Delete/ListItem_Delete_Start.test';
import ListItem_Delete_Start_Default from './ListItem_Delete/ListItem_Delete_Start_Default.test';
import ListItem_Delete_Start_String from './ListItem_Delete/ListItem_Delete_Start_String.test';
import ListItem_Delete_Start_Resource from './ListItem_Delete/ListItem_Delete_Start_Resource.test';
import List_scrollToIndex1 from './List_scrollToIndex/List_scrollToIndex1.test';
import List_scrollToIndex2 from './List_scrollToIndex/List_scrollToIndex2.test';
import List_scrollToIndex3 from './List_scrollToIndex/List_scrollToIndex3.test';
import List_Space_Percentage from './List_SpaceChange/List_Space_Percentage.test';
import listItemGroup_Space_Percentage from './List_SpaceChange/listItemGroup_Space_Percentage.test';
import List_aspectRatio_width from './List_aspectRatio/List_aspectRatio/List_aspectRatio_width.test';
import List_aspectRatio_height from './List_aspectRatio/List_aspectRatio/List_aspectRatio_height.test';
import List_aspectRatio_all from './List_aspectRatio/List_aspectRatio/List_aspectRatio_all.test';
import List_aspectRatio_neither from './List_aspectRatio/List_aspectRatio/List_aspectRatio_neither.test';
import ListItem_aspectRatio_width from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width.test';
import ListItem_aspectRatio_height from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_height.test';
import ListItem_aspectRatio_all from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_all.test';
import ListItem_aspectRatio_neither
  from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_neither.test';
import ListItem_aspectRatio_width2 from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width2.test';
import ListItem_aspectRatio_height2
  from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_height2.test';
import ListItem_aspectRatio_all2 from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_all2.test';
import ListItem_aspectRatio_neither2
  from './List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_neither2.test';
import ListItemGroup_aspectRatio_width
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_width.test';
import ListItemGroup_aspectRatio_height
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_height.test';
import ListItemGroup_aspectRatio_all
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_all.test';
import ListItemGroup_aspectRatio_neither
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_neither.test';
import ListItemGroup_aspectRatio_width2
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_width2.test';
import ListItemGroup_aspectRatio_height2
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_height2.test';
import ListItemGroup_aspectRatio_all2
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_all2.test';
import ListItemGroup_aspectRatio_neither2
  from './List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_neither2.test';
import List_divider_number from './List_divider/List_divider_number.test';
import List_divider_string from './List_divider/List_divider_string.test';
import List_strokeWidth from './List_divider/List_strokeWidth.test';
import List_divider_resource from './List_divider/List_divider_resource.test';
import listSwipeActionJsunit from './ListItem_SwipeActionItem/listSwipeAction.test';
import listSwipeNoActionJsunit from './ListItem_SwipeActionItem/listSwipeNoAction.test'
import listSwipe06Jsunit from './ListItem_SwipeActionItem/listSwipe06.test'
import listSwipeActionEndJsunit from './ListItem_SwipeActionItem/listSwipeActionEnd.test'
import listSwipeAction12EndJsunit from './ListItem_SwipeActionItem/listSwipeAction12End.test'
import listSwipeAction13EndJsunit from './ListItem_SwipeActionItem/listSwipeAction13End.test'
import listSwipeAction15Jsunit from './ListItem_SwipeActionItem/listSwipeAction15.test'
import listSwipeAction19Jsunit from './ListItem_SwipeActionItem/listSwipeAction19.test'
import listSwipeAction20Jsunit from './ListItem_SwipeActionItem/listSwipeAction20.test'
import listSwipeAction23Jsunit from './ListItem_SwipeActionItem/listSwipeAction23.test'
import listSwipeAction27Jsunit from './ListItem_SwipeActionItem/listSwipeAction27.test'
import listSwipeAction28Jsunit from './ListItem_SwipeActionItem/listSwipeAction28.test'
import listSwipeAction29Jsunit from './ListItem_SwipeActionItem/listSwipeAction29.test'
import listSwipeAction34Jsunit from './ListItem_SwipeActionItem/listSwipeAction34.test'
import listSwipeAction36Jsunit from './ListItem_SwipeActionItem/listSwipeAction36.test'
import listSwipeAction41Jsunit from './ListItem_SwipeActionItem/listSwipeAction41.test'
import listSwipeAction43Jsunit from './ListItem_SwipeActionItem/listSwipeAction43.test'

export default function testsuite() {
  ListTestJsunit()
  ListItemJsunit()
  ListCrownTest()
  ListAddJsunit()
  ListOffSet01Jsunit()
  ListJsunit();
  ListFrictionTest();
  ListLanes();
  ListLanes02();
  ListLanes03();
  ListLanes04();
  ListLanes05();
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
}