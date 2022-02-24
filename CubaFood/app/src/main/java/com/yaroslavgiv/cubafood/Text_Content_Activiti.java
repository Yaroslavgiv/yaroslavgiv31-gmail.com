package com.yaroslavgiv.cubafood;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class Text_Content_Activiti extends AppCompatActivity {
    private TextView text_content; // текст
    private Typeface fase1;
    private ImageView iContent;  // картинки
    private SharedPreferences def_pref;
    //    категория
    private int category = 0;
    //    позиция в списке
    private int position = 0;
    //    позиции названий текста и картинки в списках
    private int[] array_burger = {R.string.burger_1, R.string.burger_2, R.string.burger_3, R.string.burger_4, R.string.burger_5, R.string.burger_6, R.string.burger_7};
    private int[] array_sandwich = {R.string.sandwich_1, R.string.sandwich_2, R.string.sandwich_3, R.string.sandwich_4, R.string.sandwich_5,
            R.string.sandwich_6, R.string.sandwich_7, R.string.sandwich_8, R.string.sandwich_9};
    private int[] array_grill = {R.string.grill_1, R.string.grill_2, R.string.grill_3, R.string.grill_4, R.string.grill_5,
            R.string.grill_6, R.string.grill_7, R.string.grill_8, R.string.grill_9, R.string.grill_10, R.string.grill_11,
            R.string.grill_12, R.string.grill_13, R.string.grill_14, R.string.grill_15, R.string.grill_16, R.string.grill_17, R.string.grill_18};
    private int[] array_tandoor = {R.string.tandoor_1, R.string.tandoor_2, R.string.tandoor_3, R.string.tandoor_4, R.string.tandoor_5,
            R.string.tandoor_6, R.string.tandoor_7, R.string.tandoor_8, R.string.tandoor_9, R.string.tandoor_10, R.string.tandoor_11,
            R.string.tandoor_12, R.string.tandoor_13, R.string.tandoor_14, R.string.tandoor_15, R.string.tandoor_16, R.string.tandoor_17, R.string.tandoor_18, R.string.tandoor_18};
    private int[] array_ingredients = {R.string.ingredients_1, R.string.ingredients_2, R.string.ingredients_3, R.string.ingredients_4, R.string.ingredients_5,
            R.string.ingredients_6, R.string.ingredients_7, R.string.ingredients_8, R.string.ingredients_9, R.string.ingredients_10};
    private int[] array_sovet = {R.string.sovet_1, R.string.sovet_2, R.string.sovet_3, R.string.sovet_4, R.string.sovet_5,
            R.string.sovet_6, R.string.sovet_7};
    //    позиции картинок по названию
    private int[] array_image_burger = {R.drawable.cubano, R.drawable.chicen, R.drawable.plescaviza, R.drawable.b_oc, R.drawable.polo, R.drawable.shcolnic, R.drawable.vegan_b};
    private int[] array_image_sandwich = {R.drawable.shef, R.drawable.gevara, R.drawable.gavana, R.drawable.gurman, R.drawable.tomat_mazarela, R.drawable.varadero,
            R.drawable.imperial, R.drawable.big_pancho, R.drawable.vegan_sen};
    private int[] array_image_grill = {R.drawable.sosiska, R.drawable.sardelki, R.drawable.kolbaski, R.drawable.krilishki, R.drawable.serdechki, R.drawable.rebra,
            R.drawable.lulya, R.drawable.myaso, R.drawable.perepela, R.drawable.kura, R.drawable.krivetka, R.drawable.steyksvin, R.drawable.steykgov, R.drawable.staykbaran,
            R.drawable.staykkurin, R.drawable.staykriba, R.drawable.ovoshi, R.drawable.griby};
    private int[] array_image_tandoor = {R.drawable.krivetk, R.drawable.raki, R.drawable.shampinony, R.drawable.som, R.drawable.rebratan, R.drawable.kartofel,
            R.drawable.svinananas, R.drawable.yagnenok, R.drawable.losos, R.drawable.indeyka, R.drawable.utka, R.drawable.chebureki, R.drawable.grudkakur, R.drawable.perecfarshir,
            R.drawable.plov, R.drawable.lepeshki, R.drawable.lavash, R.drawable.samsa, R.drawable.ovoshitan};


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.text_content);
        init(); // инициализация функции для текста, картинок и шрифта

        reciveIntent();
    }

    //поиск по категориям и названиям в списках
    private void reciveIntent() {
        Intent i = getIntent();
        if (i != null) {
            category = i.getIntExtra("category", 0);
            position = i.getIntExtra("position", 0);
        }
        switch (category) {
            case 0:
                iContent.setImageResource(array_image_burger[position]);
                text_content.setText(array_burger[position]);
                break;
            case 1:
                iContent.setImageResource(array_image_sandwich[position]);
                text_content.setText(array_sandwich[position]);
                break;
            case 2:
                iContent.setImageResource(array_image_grill[position]);
                text_content.setText(array_grill[position]);
                break;
            case 3:
                iContent.setImageResource(array_image_tandoor[position]);
                text_content.setText(array_tandoor[position]);
                break;
            case 4:
                text_content.setText(array_ingredients[position]);
                break;
            case 5:
                text_content.setText(array_sovet[position]);
                break;


        }
    }

    private void init() {
        Context context;
        def_pref = PreferenceManager.getDefaultSharedPreferences(this);
        text_content = findViewById(R.id.text_main_content); // переменная для подключения id текста
        iContent = findViewById(R.id.imageContent); // переменная для подключения id картинки
        fase1 = Typeface.createFromAsset(this.getAssets(), "fonts/Lobster-Regular.ttf");
        text_content.setTypeface(fase1); // переменная для подключения шрифта
        String text = def_pref.getString("main_text_size", "Средний");
        if (text != null) {
            switch (text) {
                case "Крупный":
                    text_content.setTextSize(26);
                    break;
                case "Средний":
                    text_content.setTextSize(20);
                    break;
                case "Мелкий":
                    text_content.setTextSize(18);
                    break;

            }
        }
    }
}
