import SetSetTest from './set/set.test';
import SetAddTest from './set/SetAdd.test';
import SetClearTest from './set/SetClear.test';
import SetConstructorTest from './set/SetConstructor.test';
import SetDeleteTest from './set/SetDelete.test';
import setEntriesTest from './set/SetEntries.test';
import SetForeachTest from './set/SetForeach.test';
import SetFromTest from './set/SetFrom.test';
import SetHasTest from './set/SetHas.test';
import SetKeysTest from './set/SetKeys.test';
import SetSymbolTest from './set/SetSymbol.test';
import SetSymbolIteratorTest from './set/Symboliterator.test';
import SetComboTest from './set1/set_combo.test';

import keyedCollections02Test from './set2/KeyedCollections_02.test';
import keyedCollections05Test from './set2/KeyedCollections_05.test';
import keyedCollections12Test from './set2/KeyedCollections_12.test';
import keyedCollections13Test from './set2/KeyedCollections_13.test';

export default function testsuite() {
  SetSetTest();
  SetAddTest();
  SetClearTest();
  SetConstructorTest();
  SetDeleteTest();
  setEntriesTest();
  SetForeachTest();
  SetFromTest();
  SetHasTest();
  SetKeysTest();
  SetSymbolTest();
  SetSymbolIteratorTest();
  SetComboTest();

  keyedCollections02Test();
  keyedCollections05Test();
  keyedCollections12Test();
  keyedCollections13Test();
}