/**
 * <a href="http://www.openolat.org">
 * OpenOLAT - Online Learning and Training</a><br>
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); <br>
 * you may not use this file except in compliance with the License.<br>
 * You may obtain a copy of the License at the
 * <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache homepage</a>
 * <p>
 * Unless required by applicable law or agreed to in writing,<br>
 * software distributed under the License is distributed on an "AS IS" BASIS, <br>
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. <br>
 * See the License for the specific language governing permissions and <br>
 * limitations under the License.
 * <p>
 * Initial code contributed and copyrighted by<br>
 * frentix GmbH, http://www.frentix.com
 * <p>
 */
package org.olat.modules.ceditor.ui.event;

import org.olat.core.gui.control.Event;
import org.olat.modules.ceditor.ui.component.ContentEditorFragment;

/**
 * 
 * Initial date: 10 déc. 2019<br>
 * @author srosse, stephane.rosse@frentix.com, http://www.frentix.com
 *
 */
public class EditPageElementEvent extends Event {
	
	private static final long serialVersionUID = -6301222775215638526L;

	public static final String EDIT_FRAGMENT = "edit-element";
	
	private final ContentEditorFragment fragment;
	
	public EditPageElementEvent(ContentEditorFragment fragment) {
		super(EDIT_FRAGMENT);
		this.fragment = fragment;
	}

	public ContentEditorFragment getFragment() {
		return fragment;
	}

}
