class Bank {
    Bank({
        required this.cardExpire,
        required this.cardNumber,
        required this.cardType,
        required this.currency,
        required this.iban,
    });

    final String cardExpire;
    final String cardNumber;
    final String cardType;
    final String currency;
    final String iban;

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
    );

    Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
    };
}