import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageComposer extends StatefulWidget {
  const MessageComposer({
    Key key,
    @required this.onTextMessage,
    @required this.onVoiceMessage,
  }) : super(key: key);

  final Function(String) onTextMessage;
  final Function(String) onVoiceMessage;

  @override
  State createState() => new MessageComposerState();
}

class MessageComposerState extends State<MessageComposer>
    with TickerProviderStateMixin {
  static final _textKey = GlobalKey<FormState>();
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() => _isComposing = text.length > 0);
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )
                    : new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() => _isComposing = false);
    widget.onTextMessage(text);
  }
}
