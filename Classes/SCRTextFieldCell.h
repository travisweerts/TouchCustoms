//
//  SCRTextFieldCell.h
//  TouchCustoms
//
//  Created by Aleks Nesterow-Rutkowski on 2/18/10.
//	aleks@screencustoms.com
//	
//	Purpose
//	Represents UITableViewCell with UITextField.
//	Can be useful for entering credentials for example.
//

@interface SCRTextFieldCell : UITableViewCell {

@private
	UILabel *_titleLabel;
	UITextField *_textField;
	CGFloat _textFieldLeftOffset;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

/** The black text on the right. */
@property (nonatomic, readonly) UILabel *titleLabel;
/** A text-field with blue text-color by default. */
@property (nonatomic, readonly) UITextField *textField;
/** The offset for textField in pixels from cell's left border. Default value is 120. */
@property (nonatomic, assign) CGFloat textFieldLeftOffset;

@end
